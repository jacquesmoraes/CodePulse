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
    Task<IEnumerable<BlogPost>> GetPopularPostsByAuthorAsync(string authorId, int count = 5 );
    Task<BlogPost?> UpdateBlogPostAsync(BlogPost UpdateBlogPost);
    Task<IEnumerable<BlogPost>> GetRelatedPostsAsync(Guid postId);
    Task<BlogPost?> DeleteBlogPostAsync(Guid id);
    Task<IEnumerable<BlogPost>> GetPopularPosts(int count = 5);
    Task<IEnumerable<BlogPost>> GetPostByAuthorAsync(string authorId);
  }
}
