namespace CodePulse.API.Models.Dto
{
  public class UpdateUserProfileResponseDto
    
  {
    public string UserId { get; set; }
    public string FullName { get; set; }
    public string UserName { get; set; }
    public string? Bio { get; set; }
    public UserImageProfileDto? Image { get; set; }
  }
}
