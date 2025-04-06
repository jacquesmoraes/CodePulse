
using Microsoft.AspNetCore.Mvc;

namespace CodePulse.API.Models.Dto
{
  public class UpdateUserProfileRequestDto
  {
    public string FullName { get; set; }
    public required string UserName { get; set; }
    public string? Bio { get; set; }
    [FromForm(Name = "ImageFile")]
    public IFormFile? ImageFile { get; set; }
  }
}
