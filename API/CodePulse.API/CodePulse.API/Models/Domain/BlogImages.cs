namespace CodePulse.API.Models.Domain
  {
  public class BlogImage
    {
    public BlogImage ( )
    {
    }

    public Guid Id { get; set; }
    public string  FileName { get; set; }
    public string FileExtension { get; set; }
    public string Title { get; set; }
    public string Url { get; set; }
    public DateTime DateCreated { get; set; } = DateTime.UtcNow;

    public BlogImage ( Guid id, string fileName, string fileExtension, string title, string url, DateTime dateCreated )
    {
      Id = id;
      FileName = fileName;
      FileExtension = fileExtension;
      Title = title;
      Url = url;
      DateCreated = dateCreated;
    }
  }
  }
