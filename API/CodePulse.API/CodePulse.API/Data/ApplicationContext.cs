using CodePulse.API.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace CodePulse.API.Data
{
    public class ApplicationContext : DbContext
    {
        public ApplicationContext(DbContextOptions<ApplicationContext> options) : base(options)
        {
        }
        public DbSet<BlogPost> BlogPosts { get; set; }
        public DbSet<Category> Categories { get; set; }
         public DbSet<BlogImage> blogImages { get; set; }
        
      
    protected override void OnModelCreating ( ModelBuilder modelBuilder ) {
      base.OnModelCreating ( modelBuilder );
      modelBuilder.Entity<BlogImage> ( ).HasIndex ( b => b.FileName ).IsUnique ( );

      // Configuração do relacionamento N:N entre BlogPost e Category
      modelBuilder.Entity<BlogPost>()
        .HasMany(b => b.Categories)
        .WithMany(c => c.BlogPosts)
        .UsingEntity(j => j.ToTable("BlogPostCategory"));
    }
    }
}
