using CodePulse.API.Data;
using CodePulse.API.Models.Domain;
using CodePulse.API.Repositories.Interface;
using Microsoft.EntityFrameworkCore;

namespace CodePulse.API.Repositories.Implementation
{
  public class BlogPostRepository : IBlogPostRepository
  {

    private readonly ApplicationContext _context;

    public BlogPostRepository(ApplicationContext context) {
      _context = context;
    }

    public async Task<BlogPost> CreateBlogPostAsync(BlogPost blogPost) {
       await _context.BlogPosts.AddAsync(blogPost);
       await _context.SaveChangesAsync();
      return blogPost;
    }

    public async Task<IEnumerable<BlogPost>> GetAllAsync() {
      return await _context.BlogPosts.ToListAsync();

    }
  }
}
