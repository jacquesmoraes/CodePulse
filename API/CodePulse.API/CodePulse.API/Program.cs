using CodePulse.API.Data;
using CodePulse.API.Repositories.Implementation;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen ( );
builder.WebHost.UseWebRoot ( "wwwroot" );
builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

builder.Services.AddDbContext<ApplicationContext>(opt =>
{
    opt.UseSqlServer(builder.Configuration.GetConnectionString("CdePulseConnectionString"));
});

builder.Services.AddDbContext<AuthContext>(opt =>
{
    opt.UseSqlServer(builder.Configuration.GetConnectionString("CdePulseConnectionString"));
});

builder.Services.AddIdentityCore<IdentityUser>()
  .AddRoles<IdentityRole>()
  .AddTokenProvider<DataProtectorTokenProvider<IdentityUser>>("CodePulse")
  .AddEntityFrameworkStores<AuthContext>()
  .AddDefaultTokenProviders();
builder.Services.Configure<IdentityOptions>(opt =>
{
  opt.Password.RequireDigit = false;
  opt.Password.RequiredLength = 6;
  opt.Password.RequireLowercase = false;
  opt.Password.RequireNonAlphanumeric = false;
  opt.Password.RequireUppercase = false;
  opt.Password.RequiredUniqueChars = 1;
  
} );
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
  .AddJwtBearer(opt =>
  {
      opt.TokenValidationParameters = new Microsoft.IdentityModel.Tokens.TokenValidationParameters
        {
          AuthenticationType = "Jwt",
          ValidateIssuer = true,
          ValidateAudience = true,
          ValidateLifetime = true,
          ValidateIssuerSigningKey = true,
          ValidIssuer = builder.Configuration ["Jwt:Issuer"],
          ValidAudience = builder.Configuration ["Jwt:Audience"],
          IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(
            builder.Configuration ["Jwt:Key"]
            ))
        };
  } );
builder.Services.AddScoped<ICategoryRepository, CategoryRepository>();
builder.Services.AddScoped<IBlogPostRepository, BlogPostRepository>();
builder.Services.AddScoped<IImageRepository, ImageRepository> ( );
builder.Services.AddScoped<ITokenRepository, TokenRepository> ( );


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseCors(options =>
{
    options.AllowAnyHeader();
    options.AllowAnyOrigin();
    options.AllowAnyMethod();
});

app.UseAuthentication();
app.UseAuthorization();
app.UseStaticFiles ( );

app.MapControllers();

app.Run();
