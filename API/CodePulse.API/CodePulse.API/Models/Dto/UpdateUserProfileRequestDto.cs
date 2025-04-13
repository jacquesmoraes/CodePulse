
using Microsoft.AspNetCore.Mvc;

namespace CodePulse.API.Models.Dto
{
  public class UpdateUserProfileRequestDto
  {
    public string? FullName { get; set; }
    public  string? UserName { get; set; }
    public string? Bio { get; set; }
    public string? Interests { get; set; }
    public IFormFile? ImageFile { get; set; }
  }
}
