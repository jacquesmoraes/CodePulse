namespace CodePulse.API.Models.Dto
{
  public class LoginResponseDto
  {
    public string Email { get; set; }
    public string Token { get; set; }
    public List<string> Roles { get; set; }
    public string UserName { get; set; }
    public string FullName { get; set; }
  }
}
