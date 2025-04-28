using CodePulse.API.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace CodePulse.API.Data;
public class ApplicationContext : DbContext
{
  public DbSet<BlogPost> BlogPosts { get; set; }
  public DbSet<Category> Categories { get; set; }
  public DbSet<BlogImage> BlogImages { get; set; }
  public DbSet<UserProfile> UsersProfiles { get; set; }
  public DbSet<UserImageProfile> UserImageProfiles { get; set; }
  public DbSet<FavoritePost> FavoritePosts { get; set; }


  public ApplicationContext ( DbContextOptions<ApplicationContext> options ) : base ( options ) { }

 protected override void OnModelCreating(ModelBuilder modelBuilder)
{
    base.OnModelCreating(modelBuilder);

    // Excluir tabelas que já existem no AuthContext
    modelBuilder.Entity<UserProfile>().ToTable("AspNetUsers", t => t.ExcludeFromMigrations());
    modelBuilder.Entity<UserImageProfile>().ToTable("UserImageProfiles", t => t.ExcludeFromMigrations());
    modelBuilder.Entity<BlogPost>().ToTable("BlogPost", t => t.ExcludeFromMigrations());
    modelBuilder.Entity<Category>().ToTable("Category", t => t.ExcludeFromMigrations());
    
    // Excluir a tabela de junção também
    modelBuilder.Entity<BlogPost>()
        .HasMany(b => b.Categories)
        .WithMany(c => c.BlogPosts)
        .UsingEntity<Dictionary<string, object>>(
            "BlogPostCategory",
            j => j.HasOne<Category>()
                .WithMany()
                .HasForeignKey("CategoriesId"),
            j => j.HasOne<BlogPost>()
                .WithMany()
                .HasForeignKey("BlogPostsId"),
            j =>
            {
                j.ToTable("BlogPostCategory", t => t.ExcludeFromMigrations());
                j.HasKey("BlogPostsId", "CategoriesId");
            }
        );

    // Configurações específicas do ApplicationContext
    modelBuilder.Entity<BlogImage>()
        .HasIndex(b => b.FileName)
        .IsUnique();
    modelBuilder.Entity<FavoritePost>()
    .HasKey(fp => fp.Id);

    modelBuilder.Entity<FavoritePost>()
        .HasOne(fp => fp.User)
        .WithMany(u => u.FavoriteBlogPosts)
        .HasForeignKey(fp => fp.UserId)
        .OnDelete(DeleteBehavior.Restrict);

    modelBuilder.Entity<FavoritePost>()
        .HasOne(fp => fp.BlogPost)
        .WithMany(bp => bp.FavoriteBlogPosts)
        .HasForeignKey(fp => fp.BlogPostId)
        .OnDelete(DeleteBehavior.Cascade);
}
}
