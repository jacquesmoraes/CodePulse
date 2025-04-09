using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;

namespace CodePulse.API.Repositories.Interface
{
  public interface IBlogPostRepository
  {
    Task<BlogPost> CreateBlogPostAsync(BlogPost blogPost);
    Task<IEnumerable<BlogPost>> GetAllAsync(string? query = null,
      string? sortBy = null,
      string? sortDirection = null,
      int? pageNumber = 1,
      int? pageSize = 100
      );
    Task<int> GetBlogPostsCountAsync();
    Task<BlogPost?> GetBlogPostByIdAsync(Guid id);
    Task<BlogPost?> GetBlogPostByUrlHandle(string urlhandle);
    Task<BlogPost?> UpdateBlogPostAsync(BlogPost UpdateBlogPost);
    Task<BlogPost?> DeleteBlogPostAsync(Guid id);
    Task<List<BlogPost>> GetPopularPosts(int count = 5);
    Task<List<BlogPost>> GetPostByAuthorAsync(string authorId);
  }
}
