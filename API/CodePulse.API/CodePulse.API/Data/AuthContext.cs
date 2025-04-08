using CodePulse.API.Models.Domain;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace CodePulse.API.Data
{
    public class AuthContext : IdentityDbContext<UserProfile>
    {
        public DbSet<UserProfile> UsersProfiles { get; set; }
        public DbSet<UserImageProfile> UserImageProfiles { get; set; }

        public AuthContext(DbContextOptions<AuthContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            
            // Configurações adicionais serão adicionadas aqui conforme necessário
            builder.Entity<UserProfile>()
                .HasOne(u => u.Image)
                .WithOne()
                .HasForeignKey<UserProfile>(u => u.ImageId)
                .OnDelete(DeleteBehavior.SetNull);
        }
    }
}
