using CodePulse.API.Models.Domain;
using System.Security.Claims;
using System.Text.Json;
using Microsoft.AspNetCore.Identity;

namespace CodePulse.API.Data
{
  public class ApplicationContextSeed
  {
    public  static async Task SeedAsync(ApplicationContext applicationContext, UserManager<UserProfile> userManager)
    {
      if ( !applicationContext.Categories.Any ( ) )
      {
        var categoriesData = await File.ReadAllTextAsync("Data/SeedData/Category.json");
        var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };
        var categories = JsonSerializer.Deserialize<List<Category>>(categoriesData, options);
        applicationContext.Categories.AddRange(categories);
      }

      if ( !applicationContext.BlogPosts.Any ( ) )
      {
        var adminUser =  await userManager.FindByEmailAsync("admin@codepulse.com")  ?? throw new Exception("Admin user not found. Please ensure the admin user is created before seeding blog posts.");
        var BlogPostsData = await File.ReadAllTextAsync("Data/SeedData/BlogPost.json");
        var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };
        var blogPosts = JsonSerializer.Deserialize<List<BlogPost>>(BlogPostsData, options);
        
        foreach (var post in blogPosts)
        {
          post.AuthorId = adminUser.Id;
        }
        
        applicationContext.BlogPosts.AddRange(blogPosts);
      }
      if(applicationContext.ChangeTracker.HasChanges())
        await applicationContext.SaveChangesAsync();
    }
  }
}
