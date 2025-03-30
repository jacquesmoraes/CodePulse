

using CodePulse.API.Extensions;

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

app.Run();
