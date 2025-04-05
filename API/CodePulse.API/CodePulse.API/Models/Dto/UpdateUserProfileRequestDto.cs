
namespace CodePulse.API.Models.Dto
{
  public class UpdateUserProfileRequestDto
  {
     public string FullName { get; set; } 
    public string? Bio { get; set; }
    public string? PhotoUrl { get; set; }
  }
}
