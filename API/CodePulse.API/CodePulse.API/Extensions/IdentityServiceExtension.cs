using CodePulse.API.Data;
using CodePulse.API.Models.Domain;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Text;

namespace CodePulse.API.Extensions
{
  public static class IdentityServiceExtension
  {
    public static IServiceCollection AddIdentityService(this IServiceCollection services,
      IConfiguration configuration )
    {
      services.AddDbContext<AuthContext> ( opt =>
      {
        opt.UseSqlServer ( configuration.GetConnectionString ( "CodePulseConnectionString" ) );
      } );

      services.AddIdentityCore<UserProfile> ( )
        .AddRoles<IdentityRole> ( )
        .AddTokenProvider<DataProtectorTokenProvider<UserProfile>> ( "CodePulse" )
        .AddEntityFrameworkStores<AuthContext> ( )
        .AddDefaultTokenProviders ( );
      services.Configure<IdentityOptions> ( opt =>
      {
        opt.Password.RequireDigit = false;
        opt.Password.RequiredLength = 6;
        opt.Password.RequireLowercase = false;
        opt.Password.RequireNonAlphanumeric = false;
        opt.Password.RequireUppercase = false;
        opt.Password.RequiredUniqueChars = 1;
        opt.User.RequireUniqueEmail = true;
      } );
      services.AddAuthentication ( JwtBearerDefaults.AuthenticationScheme )
        .AddJwtBearer ( opt =>
        {
          opt.TokenValidationParameters = new TokenValidationParameters
          {
            AuthenticationType = "Jwt",
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true,
            ValidIssuer = configuration ["Jwt:Issuer"],
            ValidAudience = configuration ["Jwt:Audience"],
            IssuerSigningKey = new SymmetricSecurityKey ( Encoding.UTF8.GetBytes (
          configuration ["Jwt:Key"]
          ) )
          };
        } );

      return services;
    }

  }
}
