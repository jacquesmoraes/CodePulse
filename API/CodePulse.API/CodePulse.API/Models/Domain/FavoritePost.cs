namespace CodePulse.API.Models.Domain
{
  public class FavoritePost
  {
    public Guid Id { get; set; }
    public string UserId { get; set; }
    public Guid BlogPostId { get; set; }
    public UserProfile User { get; set; }
    public BlogPost BlogPost { get; set; }
    public DateTime FavoritedAt { get; set; } = DateTime.UtcNow;
    public FavoritePost ( )
    {

    } 
  }
}
