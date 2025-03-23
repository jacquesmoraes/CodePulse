
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;

namespace CodePulse.API.Repositories.Interface
{
  public interface IBlogPostRepository
  {
    Task<BlogPost> CreateBlogPostAsync(BlogPost blogPost);
    Task<IEnumerable<BlogPost>> GetAllAsync();
    Task<BlogPost?> GetBlogPostByIdAsync ( Guid id );
    Task<BlogPost?> GetBlogPostByUrlHandle ( string urlhandle );
    Task<BlogPost?> UpdateBlogPostAsync (BlogPost UpdateBlogPost );
    Task<BlogPost?> DeleteBlogPostAsync ( Guid id );
  }
}
