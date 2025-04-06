using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodePulse.API.Models.Dto
{
 public class UserProfileDto
{
    public required string UserId { get; set; } // do IdentityUser
    public required string UserName { get; set; } // do IdentityUser
    public required string Email { get; set; } // do IdentityUser

    public required string FullName { get; set; }
    public string? Bio { get; set; }
    public string? ImageUrl { get; set; } // do UserImageProfile
}

}
