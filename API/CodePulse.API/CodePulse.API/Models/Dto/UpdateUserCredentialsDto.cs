namespace CodePulse.API.Models.Dto
{
  public class UpdateUserCredentialsDto
  {
    public string? CurrentPassword { get; set; }
    public string? NewPassword { get; set; }
  }
}
