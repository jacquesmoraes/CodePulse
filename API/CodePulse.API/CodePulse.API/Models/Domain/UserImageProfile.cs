namespace CodePulse.API.Models.Domain
{
  public class UserImageProfile
  {
       public Guid Id { get; set; }
    public string  FileName { get; set; }
    public string FileExtension { get; set; }
     public string Url { get; set; }
  }
}
