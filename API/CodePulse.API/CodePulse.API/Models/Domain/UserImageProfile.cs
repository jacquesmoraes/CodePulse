namespace CodePulse.API.Models.Domain
{
  public class UserImageProfile
  {
    public UserImageProfile ( )
    {
    }

    public Guid Id { get; set; }
    public string  FileName { get; set; }
    public string FileExtension { get; set; }
     public string Url { get; set; }

    public UserImageProfile ( Guid id, string fileName, string fileExtension, string url )
    {
      Id = id;
      FileName = fileName;
      FileExtension = fileExtension;
      Url = url;
    }
  }
}
