using CodePulse.API.Models.Domain;

namespace CodePulse.API.Models.Dto
{
  public class FavoritePostDto
  {
    public Guid Id { get; set; }
    public string UserId { get; set; }
    public Guid BlogPostId { get; set; }

    public string BlogPostTitle { get; set; }
    public string BlogPostUrlHandle { get; set; }
    public string BlogPostImageUrl { get; set; }

    public string AuthorUserName { get; set; }
    public DateTime FavoritedAt { get; set; }
  }

}
