using Microsoft.AspNetCore.Identity;

namespace CodePulse.API.Models.Domain
{
  public class BlogPostComment
  {
    public Guid Id { get; set; }
    public string Content { get; set; } = string.Empty;


    public Guid BlogPostId { get; set; }
    public BlogPost blogPost { get; set; }

    public string UserName { get; set; }
    
    public DateTime CommentDate { get; set; } = DateTime.UtcNow;

  }
}
