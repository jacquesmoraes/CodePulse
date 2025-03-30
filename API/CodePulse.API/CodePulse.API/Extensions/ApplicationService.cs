using CodePulse.API.Data;
using CodePulse.API.Repositories.Implementation;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Text;

namespace CodePulse.API.Extensions
{
  public static class ApplicationService
  {
    public static IServiceCollection AddApplicationServices ( this IServiceCollection services,
      IConfiguration config )
    {


      services.AddControllers ( );
      // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
      services.AddEndpointsApiExplorer ( );
      services.AddSwaggerGen ( );
      
      services.AddAutoMapper ( AppDomain.CurrentDomain.GetAssemblies ( ) );

      services.AddDbContext<ApplicationContext> ( opt =>
      {
        opt.UseSqlServer(config.GetConnectionString ( "CdePulseConnectionString" ) );
      } );

      
      services.AddScoped<ICategoryRepository, CategoryRepository> ( );
      services.AddScoped<IBlogPostRepository, BlogPostRepository> ( );
      services.AddScoped<IImageRepository, ImageRepository> ( );
      services.AddScoped<ITokenRepository, TokenRepository> ( );

      return services;
    }
  }
}
