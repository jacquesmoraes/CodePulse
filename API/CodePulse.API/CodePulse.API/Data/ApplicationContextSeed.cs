using CodePulse.API.Models.Domain;
using System.Security.Claims;
using System.Text.Json;
using Microsoft.AspNetCore.Identity;
using System.Text.Json.Serialization;

namespace CodePulse.API.Data
{
  public class ApplicationContextSeed
  {
    public static async Task SeedAsync ( ApplicationContext applicationContext, UserManager<UserProfile> userManager )
    {
      try
      {
        if ( !applicationContext.Categories.Any ( ) )
        {
          var categoriesData = await File.ReadAllTextAsync("Data/SeedData/Category.json");
          var options = new JsonSerializerOptions
          {
            PropertyNameCaseInsensitive = true,
            // Adiciona configuração específica para datas
            Converters = { new JsonDateTimeConverter() }
          };
          var categories = JsonSerializer.Deserialize<List<Category>>(categoriesData, options);

          // Garante que os IDs são novos
          foreach ( var category in categories )
          {
            category.Id = Guid.NewGuid ( );
          }

          await applicationContext.Categories.AddRangeAsync ( categories );
          await applicationContext.SaveChangesAsync ( );
        }

        if ( !applicationContext.BlogPosts.Any ( ) )
        {
          var adminUser = await userManager.FindByEmailAsync("admin@codepulse.com")
                ?? throw new Exception("Admin user not found");

          var BlogPostsData = await File.ReadAllTextAsync("Data/SeedData/BlogPost.json");
          var options = new JsonSerializerOptions
          {
            PropertyNameCaseInsensitive = true,
            Converters = { new JsonDateTimeConverter() }
          };
          var blogPosts = JsonSerializer.Deserialize<List<BlogPost>>(BlogPostsData, options);

          foreach ( var post in blogPosts )
          {
            post.Id = Guid.NewGuid ( );
            post.AuthorId = adminUser.Id;
            post.PublishedDate = DateTime.SpecifyKind ( post.PublishedDate, DateTimeKind.Utc );
          }

          await applicationContext.BlogPosts.AddRangeAsync ( blogPosts );
          await applicationContext.SaveChangesAsync ( );
        }
      }
      catch ( Exception ex )
      {
        throw new Exception ( $"Error seeding data: {ex.Message}", ex );
      }
    }

    // Adicione esta classe para lidar com a conversão de datas
    public class JsonDateTimeConverter : JsonConverter<DateTime>
    {
      public override DateTime Read ( ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options )
      {
        var dateTime = reader.GetDateTime();
        return DateTime.SpecifyKind ( dateTime, DateTimeKind.Utc );
      }

      public override void Write ( Utf8JsonWriter writer, DateTime value, JsonSerializerOptions options )
      {
        writer.WriteStringValue ( value.ToUniversalTime ( ).ToString ( "O" ) );
      }
    }
  }
}
