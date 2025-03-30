using CodePulse.API.Models.Domain;

namespace CodePulse.API.Repositories.Interface
{
  public interface ICommentRepository
  {
    Task addCommentAscync (BlogPostComment comment );
    Task<List<BlogPostComment>> GetByPostId(Guid postId);
  }
}
