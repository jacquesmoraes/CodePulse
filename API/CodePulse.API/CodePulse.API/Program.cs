using CodePulse.API.Data;
using CodePulse.API.Extensions;
using CodePulse.API.Models.Domain;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddApplicationServices(builder.Configuration);
builder.Services.AddIdentityService(builder.Configuration);
builder.Services.AddEmailServices ( builder.Configuration );
builder.WebHost.UseWebRoot("wwwroot");
builder.Logging.ClearProviders();
builder.Logging.AddConsole();
builder.Logging.AddDebug();

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
    options.WithOrigins("http://localhost:4200", "https://localhost:7167");
    options.AllowAnyMethod();
    options.AllowCredentials();
});

app.UseAuthentication();
app.UseAuthorization();
app.UseStaticFiles();

app.MapControllers();

using var scopes = app.Services.CreateScope();
var services = scopes.ServiceProvider;
var context = services.GetRequiredService<ApplicationContext>();
var authContext = services.GetRequiredService<AuthContext>();
var userManager = services.GetRequiredService<UserManager<UserProfile>>();
var roleManager = services.GetRequiredService<RoleManager<IdentityRole>>();
var logger = services.GetRequiredService<ILogger<Program>>();

try
{
    await context.Database.MigrateAsync();
    await authContext.Database.MigrateAsync();

    // Seed roles
    string[] roles = { "Admin", "Writer", "User" };
    foreach (var role in roles)
    {
        if (!await roleManager.RoleExistsAsync(role))
        {
            await roleManager.CreateAsync(new IdentityRole(role));
        }
    }

    // Seed admin user
    var adminUser = await userManager.FindByEmailAsync("admin@codepulse.com");
    if (adminUser == null)
    {
        adminUser = new UserProfile
        {
            UserName = "admin@codepulse.com",
            Email = "admin@codepulse.com",
            FullName = "Admin",
            EmailConfirmed = true
        };

        var result = await userManager.CreateAsync(adminUser, "Admin@123");
        if (result.Succeeded)
        {
            await userManager.AddToRoleAsync(adminUser, "Admin");
            await userManager.AddToRoleAsync(adminUser, "Writer");
        }
    }

    await ApplicationContextSeed.SeedAsync(context, userManager);
}
catch(Exception err)
{
    logger.LogError(err, "an error occured during migration");
}

await app.RunAsync();
