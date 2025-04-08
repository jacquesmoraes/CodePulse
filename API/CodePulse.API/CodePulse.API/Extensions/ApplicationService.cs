using CodePulse.API.Data;
using CodePulse.API.Mapping;
using CodePulse.API.Repositories.Implementation;
using CodePulse.API.Repositories.Interface;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;

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

      
      
      services.AddAutoMapper(typeof(BlogPostMappingProfile));


      services.AddDbContext<ApplicationContext> ( opt =>
      {
        opt.UseSqlServer(config.GetConnectionString ( "CodePulseConnectionString" ) );
      } );
      services.AddSwaggerGen(options =>
      {
          options.SwaggerDoc("v1", new OpenApiInfo { Title = "CodePulse API", Version = "v1" });

          // Adiciona suporte ao JWT
          options.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
          {
              Description = "Insira o token JWT no formato: Bearer {seu token}",
              Name = "Authorization",
              In = ParameterLocation.Header,
              Type = SecuritySchemeType.ApiKey,
              Scheme = "Bearer"
          });

          options.AddSecurityRequirement(new OpenApiSecurityRequirement()
          {
              {
                  new OpenApiSecurityScheme
                  {
                      Reference = new OpenApiReference { Type = ReferenceType.SecurityScheme, Id = "Bearer" },
                      Scheme = "oauth2",
                      Name = "Bearer",
                      In = ParameterLocation.Header,
                  },
                  new List<string>()
              }
          });

          // Adiciona suporte a XML comments
          var xmlFile = $"{System.Reflection.Assembly.GetExecutingAssembly().GetName().Name}.xml";
          var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
          options.IncludeXmlComments(xmlPath);
      });
      
      services.AddScoped<ICategoryRepository, CategoryRepository> ( );
      services.AddScoped<IBlogPostRepository, BlogPostRepository> ( );
      services.AddScoped<IImageRepository, ImageRepository> ( );
      services.AddScoped<ITokenRepository, TokenRepository> ( );
      services.AddScoped<IUserRepository, UserRepository>();
      services.AddScoped<IUserImageProfileRepository, UserImageProfileRepository>();
      services.AddScoped<IUserManagmentRepository, UserManagementRepository>();

      return services;
    }
  }
}
