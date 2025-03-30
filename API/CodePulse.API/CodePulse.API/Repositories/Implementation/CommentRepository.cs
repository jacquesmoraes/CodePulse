using CodePulse.API.Data;
using CodePulse.API.Models.Domain;
using CodePulse.API.Repositories.Interface;
using Microsoft.EntityFrameworkCore;

namespace CodePulse.API.Repositories.Implementation
{
  public class CommentRepository : ICommentRepository
  {
    private readonly ApplicationContext _context;

    public CommentRepository (ApplicationContext context )
    {
      _context = context;
    }

    public async Task addCommentAscync ( BlogPostComment comment )
    {
      await _context.BlogPostComments.AddAsync(comment);
      await _context.SaveChangesAsync();
    }

    public async Task<List<BlogPostComment>> GetByPostId ( Guid postId )
    {
      return await _context.BlogPostComments.Where(x =>
      x.BlogPostId == postId).OrderByDescending(c => c.CommentDate).ToListAsync();
    }
  }
}
