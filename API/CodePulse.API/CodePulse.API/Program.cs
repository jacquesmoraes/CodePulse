

using CodePulse.API.Data;
using CodePulse.API.Extensions;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddApplicationServices(builder.Configuration);
builder.Services.AddIdentityService(builder.Configuration);
builder.WebHost.UseWebRoot ( "wwwroot" );


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
    options.WithOrigins("http://localhost:4200");
    options.AllowAnyMethod();
  options.AllowCredentials();
});

app.UseAuthentication();
app.UseAuthorization();
app.UseStaticFiles ( );

app.MapControllers();


using var scopes = app.Services.CreateScope();
var services = scopes.ServiceProvider;
var context = services.GetRequiredService<ApplicationContext>();
var identity = services.GetRequiredService<AuthContext>();
var logger = services.GetRequiredService<ILogger<Program>>();
try
{
  await context.Database.MigrateAsync();
  await ApplicationContextSeed.SeedAsync(context);

}
catch(Exception err )
{
  logger.LogError(err, "an error occured during migration");
}



app.Run();
