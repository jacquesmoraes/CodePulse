using CodePulse.API.Configuration;

namespace CodePulse.API.Extensions
{

  public static class SecurityServiceExtensions
  {
    public static IServiceCollection AddSecurityServices (
        this IServiceCollection services,
        IConfiguration configuration )
    {
      var securitySettings = new SecuritySettings();
      configuration.GetSection ( "SecuritySettings" ).Bind ( securitySettings );

      services.Configure<SecuritySettings> ( configuration.GetSection ( "SecuritySettings" ) );

      services.AddCors ( options =>
      {
        options.AddPolicy ( "DefaultPolicy", policy =>
              {
            policy
             .WithOrigins ( securitySettings.AllowedOrigins?.ToArray ( ) ??
                 new [] { "http://localhost:4200", "https://localhost:7167" } )
             .WithHeaders ( "Authorization", "Content-Type", "Accept", "Origin", "X-Requested-With" )
             .WithMethods ( "GET", "POST", "PUT", "DELETE", "OPTIONS" )
             .AllowCredentials ( );
          } );
      } );

      return services;
    }

    public static IApplicationBuilder UseSecurityHeaders (
        this IApplicationBuilder app,
        IConfiguration configuration )
    {
      var securitySettings = new SecuritySettings();
      configuration.GetSection ( "SecuritySettings" ).Bind ( securitySettings );

      app.Use ( async ( context, next ) =>
      {
        foreach ( var header in securitySettings.SecurityHeaders )
        {
          context.Response.Headers.Add ( header.Key, header.Value );
        }

        // Adiciona CSP separadamente pois é mais complexo
        context.Response.Headers.Add (
                  "Content-Security-Policy",
                  "default-src 'self'; " +
                  "img-src 'self' data: https:; " +
                  "font-src 'self'; " +
                  "style-src 'self' 'unsafe-inline'; " +
                  "script-src 'self' 'unsafe-inline' 'unsafe-eval'; " +
                  "frame-ancestors 'none';"
              );

        await next ( );
      } );

      return app;
    }
  }
}

