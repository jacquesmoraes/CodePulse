namespace CodePulse.API.Models.Dto
{
  public class UserProfileDto
  {
    public string Id { get; set; }
    public string UserName { get; set; }
    public string Email { get; set; }
    public string FullName { get; set; }
    public string? Bio { get; set; }
    public string? Interests { get; set; }
    public string? ImageUrl { get; set; }
    public string Role { get; set; }
  }
}
