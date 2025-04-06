using CodePulse.API.Models.Domain;
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

    public DbSet<UserProfile> UsersProfiles { get; set; }
    public DbSet<UserImageProfile> UserImageProfiles { get; set; }

    protected override void OnModelCreating ( ModelBuilder builder )
    {
      base.OnModelCreating ( builder );

      var readerRoleId = "a8e07f31-c8e6-4738-9d78-5b6d0765ff16";
      var writerRoleId = "e2f16115-1c6c-494c-9416-17af701714a3";
      var adminRoleId = "d2fb80a2-bf43-4287-95dd-f64719e2f6c7";

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
                },
                 new IdentityRole
                {
                     Id = adminRoleId,
                     Name = "Admin",
                     NormalizedName = "ADMIN",
                     ConcurrencyStamp = adminRoleId
                }
            };

      builder.Entity<IdentityRole> ( ).HasData ( roles );

      var adminUserId = "6350ca1c-7461-43c1-b058-02ac44f88f79";
      var adminProfileId = Guid.Parse("b9b29770-6a67-4c21-bbf2-e1c8dfcde122");

      var adminUser = new IdentityUser
      {
        Id = adminUserId,
        UserName = "Admin",
        Email = "admin@codepulse.com",
        NormalizedEmail = "ADMIN@CODEPULSE.COM",
        NormalizedUserName = "ADMIN@CODEPULSE.COM",
        EmailConfirmed = true,
        SecurityStamp = Guid.NewGuid().ToString(),
        ConcurrencyStamp = Guid.NewGuid().ToString()
      };

      adminUser.PasswordHash = new PasswordHasher<IdentityUser> ( )
          .HashPassword ( adminUser, "Admin@123" );

      builder.Entity<IdentityUser> ( ).HasData ( adminUser );

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
                },
                new IdentityUserRole<string>
                {
                    UserId = adminUserId,
                     RoleId = adminRoleId  // Adicione esta linha
                 }
            };

      builder.Entity<IdentityUserRole<string>> ( ).HasData ( adminRoles );

      builder.Entity<UserProfile> ( ).HasData (
          new UserProfile
          {
            Id = adminProfileId,
            UserId = adminUserId,
            FullName = "Administrador",
            Bio = "Administrador do sistema",
            UserName = "admin"


          }
      );
    }
  }
}
