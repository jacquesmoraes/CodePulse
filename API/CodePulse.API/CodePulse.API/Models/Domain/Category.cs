namespace CodePulse.API.Models.Domain
{
    public class Category
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string UrlHandle { get; set; }
    public List<BlogPost> BlogPosts { get; set; }

    public Category ( )
    {
    }

    public Category ( Guid id, string name, string urlHandle )
    {
      Id = id;
      Name = name;
      UrlHandle = urlHandle;
    }
  }
}
