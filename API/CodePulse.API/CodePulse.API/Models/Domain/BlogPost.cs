using System.ComponentModel.DataAnnotations.Schema;

namespace CodePulse.API.Models.Domain
{
  public class BlogPost
  {
    public Guid Id { get; set; }
    public string Title { get; set; }
    public string ShortDescription { get; set; }
    public string Content { get; set; }
    public string FeaturedImageUrl { get; set; }
    public string UrlHandle { get; set; }
    public DateTime PublishedDate { get; set; }
    public bool IsVisible { get; set; }
    public int ViewCount { get; set; }
    public List<Category> Categories { get; set; } = new List<Category>();
    public ICollection<FavoritePost> FavoriteBlogPosts { get; set; } = new List<FavoritePost> ( );
    public string AuthorId { get; set; }
    [ForeignKey("AuthorId")]
    public UserProfile AuthorProfile { get; set; }

    public BlogPost()
    {
      
    }
  }
}
