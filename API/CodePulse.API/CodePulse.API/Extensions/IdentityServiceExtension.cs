using CodePulse.API.Data;
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
        opt.UseSqlServer ( configuration.GetConnectionString ( "CdePulseConnectionString" ) );
      } );

      services.AddIdentityCore<IdentityUser> ( )
        .AddRoles<IdentityRole> ( )
        .AddTokenProvider<DataProtectorTokenProvider<IdentityUser>> ( "CodePulse" )
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

      } );
      services.AddAuthentication ( JwtBearerDefaults.AuthenticationScheme )
        .AddJwtBearer ( opt =>
        {
          opt.TokenValidationParameters = new Microsoft.IdentityModel.Tokens.TokenValidationParameters
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
