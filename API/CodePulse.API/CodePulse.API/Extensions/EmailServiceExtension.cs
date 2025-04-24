using CodePulse.API.Configuration;
using CodePulse.API.Repositories.Implementation;
using CodePulse.API.Repositories.Interface.Service;


namespace CodePulse.API.Extensions
{
  public static class EmailServiceExtension
    {
        public static IServiceCollection AddEmailServices(
            this IServiceCollection services,
            IConfiguration configuration)
        {
            // Configura as opções do SMTP
            services.Configure<SmtpSettings>(
                configuration.GetSection(SmtpSettings.SectionName));

            // Registra o serviço de email
            services.AddScoped<IEmailService, SmtpEmailService>();

            return services;
        }
    }
}
