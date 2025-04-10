using CodePulse.API.Models.Domain;
using Microsoft.EntityFrameworkCore;

public class ApplicationContext : DbContext
{
    public DbSet<BlogPost> BlogPosts { get; set; }
    public DbSet<Category> Categories { get; set; }
    public DbSet<BlogImage> BlogImages { get; set; }
    public DbSet<UserProfile> UsersProfiles { get; set; }

    public ApplicationContext(DbContextOptions<ApplicationContext> options) : base(options) { }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.Entity<UserProfile>().ToTable("AspNetUsers", t => t.ExcludeFromMigrations());
        
        // Configuração para usar a tabela UserImageProfiles
        modelBuilder.Entity<UserImageProfile>().ToTable("UserImageProfiles", t => t.ExcludeFromMigrations());

        // Relacionamentos
        modelBuilder.Entity<BlogPost>()
            .HasOne(b => b.AuthorProfile)
            .WithMany()
            .HasForeignKey(b => b.AuthorId)
            .OnDelete(DeleteBehavior.Restrict);

        modelBuilder.Entity<BlogImage>().HasIndex(b => b.FileName).IsUnique();

        modelBuilder.Entity<BlogPost>()
            .HasMany(b => b.Categories)
            .WithMany(c => c.BlogPosts)
            .UsingEntity(j => j.ToTable("BlogPostCategory"));
    }
}
