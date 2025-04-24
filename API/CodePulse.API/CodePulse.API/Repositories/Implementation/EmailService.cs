using CodePulse.API.Repositories.Interface.Service;
using System.Net.Mail;
using System.Net;
using CodePulse.API.Configuration;
using CodePulse.API.Exceptions;

namespace CodePulse.API.Repositories.Implementation
{
 
   public class SmtpEmailService : IEmailService
    {
        private readonly IConfiguration _configuration;
        private readonly ILogger<SmtpEmailService> _logger;
        private readonly SmtpSettings _smtpSettings;


        public SmtpEmailService(IConfiguration configuration, ILogger<SmtpEmailService> logger)
        {
            _configuration = configuration;
            _logger = logger;
            
            // Validar configurações no startup
            _smtpSettings = new SmtpSettings
            {
                Host = _configuration["Smtp:Host"] ?? 
                    throw new ArgumentNullException("Smtp:Host não configurado"),
                Port = int.Parse(_configuration["Smtp:Port"] ?? "587"),
                User = _configuration["Smtp:User"] ?? 
                    throw new ArgumentNullException("Smtp:User não configurado"),
                Pass = _configuration["Smtp:Pass"] ?? 
                    throw new ArgumentNullException("Smtp:Pass não configurado"),
                From = _configuration["Smtp:From"] ?? 
                    throw new ArgumentNullException("Smtp:From não configurado")
            };
        }

        public async Task SendAsync(string to, string subject, string htmlBody)
        {
            if (string.IsNullOrEmpty(to))
                throw new ArgumentException("Destinatário não pode ser vazio", nameof(to));
            
            if (string.IsNullOrEmpty(subject))
                throw new ArgumentException("Assunto não pode ser vazio", nameof(subject));
            
            if (string.IsNullOrEmpty(htmlBody))
                throw new ArgumentException("Corpo do email não pode ser vazio", nameof(htmlBody));

            using var client = CreateSmtpClient();
            using var mail = CreateMailMessage(to, subject, htmlBody);

            try
            {
                await client.SendMailAsync(mail);
                _logger.LogInformation("E-mail enviado com sucesso para {to}. Assunto: {subject}", to, subject);
            }
            catch (SmtpException ex)
            {
                _logger.LogError(ex, "Erro SMTP ao enviar e-mail para {to}. Código: {StatusCode}", 
                    to, ex.StatusCode);
                throw new EmailServiceException("Erro ao enviar e-mail via SMTP", ex);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Erro inesperado ao enviar e-mail para {to}", to);
                throw new EmailServiceException("Erro inesperado ao enviar e-mail", ex);
            }
        }

        private SmtpClient CreateSmtpClient()
        {
            return new SmtpClient(_smtpSettings.Host, _smtpSettings.Port)
            {
                Credentials = new NetworkCredential(_smtpSettings.User, _smtpSettings.Pass),
                EnableSsl = true,
                Timeout = 30000, // 30 segundos
                DeliveryMethod = SmtpDeliveryMethod.Network
            };
        }

        private MailMessage CreateMailMessage(string to, string subject, string htmlBody)
        {
            var mail = new MailMessage
            {
                From = new MailAddress(_smtpSettings.From),
                Subject = subject,
                Body = htmlBody,
                IsBodyHtml = true,
                Priority = MailPriority.Normal
            };

            // Validar email do destinatário
            try
            {
                mail.To.Add(new MailAddress(to));
            }
            catch (FormatException ex)
            {
                throw new ArgumentException("Email do destinatário inválido", nameof(to), ex);
            }

            return mail;
        }
    }
  }

