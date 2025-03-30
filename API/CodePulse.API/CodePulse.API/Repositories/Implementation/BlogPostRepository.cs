using AutoMapper;
using CodePulse.API.Data;
using CodePulse.API.Models.Domain;

using CodePulse.API.Repositories.Interface;

using Microsoft.EntityFrameworkCore;

namespace CodePulse.API.Repositories.Implementation
  {
  public class BlogPostRepository : IBlogPostRepository
    {

    private readonly ApplicationContext _context;
    

    public BlogPostRepository ( ApplicationContext context ) {
      _context = context;
      
      }

    public async Task<BlogPost> CreateBlogPostAsync ( BlogPost blogPost ) {
      await _context.BlogPosts.AddAsync ( blogPost );
      await _context.SaveChangesAsync ( );
      return blogPost;
      }

    public async Task<IEnumerable<BlogPost>> GetAllAsync (string? query = null,
      string? sortBy = null,
      string? sortDirection = null,
      int? pageNumber = 1,
      int? pageSize = 100 ) {

      //query
      var blogPost = _context.BlogPosts.AsQueryable();
      //filter
      if(string.IsNullOrEmpty(query)== false )
      {
        blogPost = blogPost.Where(x =>
        x.Title.Contains(query) ||
        x.Content.Contains(query) ||
        x.ShortDescription.Contains(query) ||
        x.Author.Contains(query));

        }

      //sort
      if(string.IsNullOrEmpty(sortBy) == false )
      {
        if(string.Equals(sortBy, "Author", StringComparison.OrdinalIgnoreCase ) )
        {
          var isAsc = string.Equals(sortDirection, "asc", StringComparison.OrdinalIgnoreCase);
          blogPost = isAsc ? blogPost.OrderBy(x => x.Author) :
            blogPost.OrderByDescending(x => x.Author);
        }
        if(string.Equals(sortBy, "PublishedDate", StringComparison.OrdinalIgnoreCase ) )
        {
          var isAsc = string.Equals(sortDirection, "asc", StringComparison.OrdinalIgnoreCase);
          blogPost = isAsc ? blogPost.OrderBy(x => x.PublishedDate) :
            blogPost.OrderByDescending(x => x.PublishedDate);
        }
      }



      //pagination
      var skipResults = (pageNumber - 1) * pageSize;
      blogPost = blogPost.Skip(skipResults ?? 0).Take(pageSize ?? 100);




      return await blogPost.Include(x => x.Categories).ToListAsync();

      }

    public async Task<BlogPost?> GetBlogPostByIdAsync ( Guid id ) {
      return await _context.BlogPosts.Include ( x => x.Categories )
      .FirstOrDefaultAsync ( bp => bp.Id == id );
      }

    public async Task<BlogPost?> UpdateBlogPostAsync ( BlogPost blogPost ) {
      var existingPost = await _context.BlogPosts
        .Include(bp => bp.Categories)
        .FirstOrDefaultAsync(bp => bp.Id == blogPost.Id);

      if ( existingPost == null )
        return null;

      _context.Entry ( existingPost ).CurrentValues.SetValues ( blogPost );

      var categoryIds = blogPost.Categories.Select(x => x.Id).ToList();
      var categories = await _context.Categories
        .Where(c => categoryIds.Contains(c.Id))
        .ToListAsync();

      existingPost.Categories.Clear ( );
      existingPost.Categories.AddRange ( categories );

      await _context.SaveChangesAsync ( );
      return existingPost;
      }

    public async Task<BlogPost?> DeleteBlogPostAsync ( Guid id ) {
      var blogPostToDelete = await _context.BlogPosts.FindAsync(id);
      if(blogPostToDelete != null){
         _context.BlogPosts.Remove ( blogPostToDelete );
        await _context.SaveChangesAsync ( );
        return blogPostToDelete;
      }
      return null;
      }

    public async Task<BlogPost?> GetBlogPostByUrlHandle ( string urlhandle ) {
      return await _context.BlogPosts.Include ( x => x.Categories )
      .FirstOrDefaultAsync ( bp => bp.UrlHandle == urlhandle );
      }

    public async Task<int> GetBlogPostsCountAsync ( )
    {
      return await _context.BlogPosts.CountAsync();
    }
  }
    }
