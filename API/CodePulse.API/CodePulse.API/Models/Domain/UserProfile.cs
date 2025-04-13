using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodePulse.API.Models.Domain
{
  [Index(nameof(UserName), IsUnique = true)]
  public class UserProfile : IdentityUser
  {
    public required string FullName { get; set; }
    public string? Bio { get; set; }
    public string? Interests { get; set; }
    public Guid? ImageId { get; set; }

    [ForeignKey("ImageId")]
    public UserImageProfile? Image { get; set; }

     public ICollection<BlogPost>? BlogPosts { get; set; }

    public UserProfile()
    {
    }

    public UserProfile(string fullName, string userName, string email) : base(userName)
    {
      FullName = fullName;
      Email = email;
      UserName = userName;
    }
  }
}
