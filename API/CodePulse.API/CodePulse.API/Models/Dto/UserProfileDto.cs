using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodePulse.API.Models.Dto
{
  public class UserProfileDto
  {
    public required string UserId { get; set; }
    public required string FullName { get; set; }
    public string? Bio { get; set; }
    public string? PhotoUrl { get; set; }

    
  }
}
