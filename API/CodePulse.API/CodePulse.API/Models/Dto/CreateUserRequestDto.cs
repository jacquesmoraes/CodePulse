namespace CodePulse.API.Models.Dto
{
  public class CreateUserRequestDto
  {
    public string Email { get; set; }
    public string Password { get; set; }
    public string FullName { get; set; }
    public string UserName { get; set; }
    public string? Bio { get; set; }
  }
}
