namespace CodePulse.API.Configuration
{
    public class SmtpSettings
    {
        public const string SectionName = "Smtp";

        public string Host { get; set; } = string.Empty;
        public int Port { get; set; }
        public string User { get; set; } = string.Empty;
        public string Pass { get; set; } = string.Empty;
        public string From { get; set; } = string.Empty;

        public void Validate()
        {
            if (string.IsNullOrEmpty(Host))
                throw new ArgumentNullException(nameof(Host), "SMTP Host não configurado");
            
            if (Port <= 0)
                throw new ArgumentException("Porta SMTP inválida", nameof(Port));
            
            if (string.IsNullOrEmpty(User))
                throw new ArgumentNullException(nameof(User), "Usuário SMTP não configurado");
            
            if (string.IsNullOrEmpty(Pass))
                throw new ArgumentNullException(nameof(Pass), "Senha SMTP não configurada");
            
            if (string.IsNullOrEmpty(From))
                throw new ArgumentNullException(nameof(From), "Email remetente não configurado");
        }
    }
}
