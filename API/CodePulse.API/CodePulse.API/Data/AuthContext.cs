using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace CodePulse.API.Data
{
  public class AuthContext : IdentityDbContext
  {
    public AuthContext ( DbContextOptions<AuthContext> options ) : base ( options )
    {
    }

    protected override void OnModelCreating ( ModelBuilder builder )
    {
      base.OnModelCreating ( builder );

      var readerRoleId = "a8e07f31-c8e6-4738-9d78-5b6d0765ff16";
      var writerRoleId = "e2f16115-1c6c-494c-9416-17af701714a3";

      // Criação dos roles
      var roles = new List<IdentityRole>
    {
        new IdentityRole
        {
            Id = readerRoleId,
            Name = "Reader",
            NormalizedName = "READER",
            ConcurrencyStamp = readerRoleId
        },
        new IdentityRole
        {
            Id = writerRoleId,
            Name = "Writer",
            NormalizedName = "WRITER",
            ConcurrencyStamp = writerRoleId
        }
    };

      // Seed dos roles
      builder.Entity<IdentityRole> ( ).HasData ( roles );

      // Usuário admin
      var adminUserId = "6350ca1c-7461-43c1-b058-02ac44f88f79";
      var adminUser = new IdentityUser
      {
        Id = adminUserId,
        UserName = "admin@codepulse.com",
        Email = "admin@codepulse.com",
        NormalizedEmail = "ADMIN@CODEPULSE.COM",
        NormalizedUserName = "ADMIN@CODEPULSE.COM",
        EmailConfirmed = true
      };

      adminUser.PasswordHash = new PasswordHasher<IdentityUser> ( ).HashPassword ( adminUser, "Admin@123" );
      builder.Entity<IdentityUser> ( ).HasData ( adminUser );

      // Associação do admin com os roles
      var adminRoles = new List<IdentityUserRole<string>>
    {
        new IdentityUserRole<string>
        {
            UserId = adminUserId,
            RoleId = readerRoleId
        },
        new IdentityUserRole<string>
        {
            UserId = adminUserId,
            RoleId = writerRoleId
        }
    };

      builder.Entity<IdentityUserRole<string>> ( ).HasData ( adminRoles );
    }
  }
}
