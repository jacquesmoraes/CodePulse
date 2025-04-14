using AutoMapper;
using CodePulse.API.Data;
using CodePulse.API.Models.Domain;
using CodePulse.API.Repositories.Interface;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace CodePulse.API.Repositories.Implementation
{
  public class BlogPostRepository : IBlogPostRepository
  {
    private readonly ApplicationContext _context;
    private readonly ILogger<BlogPostRepository> _logger;

    public BlogPostRepository(ApplicationContext context, ILogger<BlogPostRepository> logger)
    {
      _context = context;
      _logger = logger;
    }

    public async Task<BlogPost> CreateBlogPostAsync(BlogPost blogPost)
    {
      await _context.BlogPosts.AddAsync(blogPost);
      await _context.SaveChangesAsync();
      return blogPost;
    }

    public async Task<IEnumerable<BlogPost>> GetAllAsync(
      string? query = null,
      string? sortBy = null,
      string? sortDirection = null,
      int? pageNumber = 1,
      int? pageSize = 100)
    {
      var blogPosts = _context.BlogPosts
        .Include(bp => bp.Categories)
        .Include(bp => bp.AuthorProfile)
        .ThenInclude(x => x.Image)
        .AsQueryable();

      if (!string.IsNullOrEmpty(query))
      {
        blogPosts = blogPosts.Where(x =>
            x.Title.Contains(query) ||
            x.Content.Contains(query) ||
            x.ShortDescription.Contains(query) ||
            x.AuthorProfile.UserName.Contains(query));
      }

      if (!string.IsNullOrEmpty(sortBy))
      {
        var isAsc = string.Equals(sortDirection, "asc", StringComparison.OrdinalIgnoreCase);

        if (string.Equals(sortBy, "Author", StringComparison.OrdinalIgnoreCase))
        {
          blogPosts = isAsc
              ? blogPosts.OrderBy(x => x.AuthorProfile.UserName)
              : blogPosts.OrderByDescending(x => x.AuthorProfile.UserName);
        }
        else if (string.Equals(sortBy, "PublishedDate", StringComparison.OrdinalIgnoreCase))
        {
          blogPosts = isAsc
              ? blogPosts.OrderBy(x => x.PublishedDate)
              : blogPosts.OrderByDescending(x => x.PublishedDate);
        }
      }

      var skipResults = (pageNumber - 1) * pageSize ?? 0;
      blogPosts = blogPosts.Skip(skipResults).Take(pageSize ?? 100);

      var posts =  await blogPosts.ToListAsync();
      foreach (var post in posts)
{
    _logger.LogInformation($"Post: {post.Title} | Autor: {post.AuthorProfile?.UserName} | ImgId: {post.AuthorProfile?.ImageId} | ImgUrl: {post.AuthorProfile?.Image?.Url}");
}

      return posts;
      
    }

    public async Task<BlogPost?> GetBlogPostByIdAsync(Guid id)
    {
      return await _context.BlogPosts
        .Include(x => x.Categories)
        .Include(x => x.AuthorProfile)
        .ThenInclude(x => x.Image)
        .FirstOrDefaultAsync(bp => bp.Id == id);
    }

    public async Task<IEnumerable<BlogPost>> GetRelatedPostsAsync(Guid postId)
{
    var currentPost = await _context.BlogPosts
        .Include(p => p.Categories)
        .FirstOrDefaultAsync(p => p.Id == postId);

    if (currentPost == null || currentPost.Categories == null || !currentPost.Categories.Any())
        return Enumerable.Empty<BlogPost>();

    var categoryIds = currentPost.Categories.Select(c => c.Id).ToList();

    return await _context.BlogPosts
        .Include(p => p.Categories)
        .Include(p => p.AuthorProfile)
        .Where(p => p.Id != postId &&
                    p.Categories.Any(c => categoryIds.Contains(c.Id)) &&
                    p.IsVisible)
        .OrderByDescending(p => p.PublishedDate)
        .Take(5)
        .ToListAsync();
}

    public async Task<BlogPost?> UpdateBlogPostAsync(BlogPost blogPost)
    {
      var existingPost = await _context.BlogPosts
        .Include(bp => bp.Categories)
        .Include(bp => bp.AuthorProfile)
        .FirstOrDefaultAsync(bp => bp.Id == blogPost.Id);

      if (existingPost == null)
        return null;

      _context.Entry(existingPost).CurrentValues.SetValues(blogPost);

      var categoryIds = blogPost.Categories.Select(x => x.Id).ToList();
      var categories = await _context.Categories
        .Where(c => categoryIds.Contains(c.Id))
        .ToListAsync();

      existingPost.Categories.Clear();
      existingPost.Categories.AddRange(categories);

      await _context.SaveChangesAsync();
      return existingPost;
    }

    public async Task<BlogPost?> DeleteBlogPostAsync(Guid id)
    {
      var blogPost = await _context.BlogPosts.FirstOrDefaultAsync(bp => bp.Id == id);
      if (blogPost == null)
        return null;

      _context.BlogPosts.Remove(blogPost);
      await _context.SaveChangesAsync();
      return blogPost;
    }

    public async Task<BlogPost?> GetBlogPostByUrlHandle(string urlhandle)
    {
      return await _context.BlogPosts
        .Include(x => x.Categories)
        .Include(x => x.AuthorProfile).ThenInclude(x => x.Image)
        .FirstOrDefaultAsync(bp => bp.UrlHandle == urlhandle);
    }

    public async Task<int> GetBlogPostsCountAsync()
    {
      return await _context.BlogPosts.CountAsync();
    }

    public async Task<List<BlogPost>> GetPopularPosts(int count = 5)
    {
      return await _context.BlogPosts
        .Include(x => x.Categories)
        .Include(x => x.AuthorProfile)
        .Where(x => x.IsVisible && x.AuthorProfile != null)
        .Select(x => new BlogPost
        {
            Id = x.Id,
            Title = x.Title,
            ShortDescription = x.ShortDescription,
            Content = x.Content,
            FeaturedImageUrl = x.FeaturedImageUrl,
            UrlHandle = x.UrlHandle,
            PublishedDate = x.PublishedDate,
            IsVisible = x.IsVisible,
            ViewCount = x.ViewCount,
            AuthorId = x.AuthorId,
            AuthorProfile = new UserProfile
            {
                Id = x.AuthorProfile.Id,
                UserName = x.AuthorProfile.UserName,
                FullName = x.AuthorProfile.FullName,
                Bio = x.AuthorProfile.Bio,
                Interests = x.AuthorProfile.Interests,
                 Image = x.AuthorProfile.Image,  // Adicione esta linha
                 ImageId = x.AuthorProfile.ImageId  
            },
            Categories = x.Categories.Select(c => new Category
            {
                Id = c.Id,
                Name = c.Name,
                UrlHandle = c.UrlHandle
            }).ToList()
        })
        .OrderByDescending(x => x.ViewCount)
        .Take(count)
        .ToListAsync();
    }

    public async Task<List<BlogPost>> GetPostByAuthorAsync(string authorId)
    {
      return await _context.BlogPosts
        .Include(x => x.Categories)
        .Include(x => x.AuthorProfile).ThenInclude(x => x.Image)
        .Where(x => x.AuthorId == authorId)
        .ToListAsync();
    }
  }
}
