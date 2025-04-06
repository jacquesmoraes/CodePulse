using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodePulse.API.Models.Domain
{
  [Index(nameof(UserName), IsUnique = true)]
  public class UserProfile
  {
    public UserProfile ( )
    {
    }

    public Guid Id { get; set; } = Guid.NewGuid ( );

    public required string UserId { get; set; }
    public required string FullName { get; set; }
    public required string UserName { get; set; }
    public string? Bio { get; set; }
    public Guid? ImageId { get; set; }

    [ForeignKey ( "ImageId" )]
    public UserImageProfile? Image { get; set; }

    [ForeignKey ( nameof ( UserId ) )]
    public IdentityUser? User { get; set; }

    public UserProfile ( Guid id, string userId, string fullName, string userName )
    {
      Id = id;
      UserId = userId;
      FullName = fullName;
      UserName = userName;
    }
  }
}
