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
    public List<Category> Categories { get; set; }
    public string Author { get; set; }

    public BlogPost(Guid id, string title, string shortDescription, string content, string featuredImageUrl, string urlHandle, DateTime publishedDate, string author, bool isVisible, int viewCount)
    {
      Id = id;
      Title = title;
      ShortDescription = shortDescription;
      Content = content;
      FeaturedImageUrl = featuredImageUrl;
      UrlHandle = urlHandle;
      PublishedDate = publishedDate;
      Author = author;
      IsVisible = isVisible;
      ViewCount = viewCount;
    }

    public BlogPost()
    {
    }
  }
}
