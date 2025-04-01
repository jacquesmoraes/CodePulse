using CodePulse.API.Models.Domain;
using System.Security.Claims;
using System.Text.Json;

namespace CodePulse.API.Data
{
  public class ApplicationContextSeed
  {
    public static async Task SeedAsync(ApplicationContext applicationContext )
    {
      if ( !applicationContext.Categories.Any ( ) )
      {
        var categoriesData = File.ReadAllText("Data/SeedData/Category.json");
        var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };
        var categories = JsonSerializer.Deserialize<List<Category>>(categoriesData, options);
        applicationContext.Categories.AddRange(categories);
      }

      if ( !applicationContext.BlogPosts.Any ( ) )
      {
        var BlogPostsData = File.ReadAllText("Data/SeedData/BlogPost.json");
        var options = new JsonSerializerOptions { PropertyNameCaseInsensitive = true };
        var blogPosts = JsonSerializer.Deserialize<List<BlogPost>>(BlogPostsData, options);
        applicationContext.BlogPosts.AddRange(blogPosts);
      }
      if(applicationContext.ChangeTracker.HasChanges())
        await applicationContext.SaveChangesAsync();
    }
  }
}
