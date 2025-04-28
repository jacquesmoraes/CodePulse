namespace CodePulse.API.Configuration
{
   public class SecuritySettings
    {
        public string[] AllowedOrigins { get; set; } = default!;
        public Dictionary<string, string> SecurityHeaders { get; set; } = new Dictionary<string, string>();

        // Construtor padrão com valores iniciais
        public SecuritySettings()
        {
            AllowedOrigins = new string[] 
            {
                "https://codepulse.vercel.app"
            };

            SecurityHeaders = new Dictionary<string, string>
            {
                { "X-Frame-Options", "DENY" },
                { "X-Content-Type-Options", "nosniff" },
                { "X-XSS-Protection", "1; mode=block" },
                { "Referrer-Policy", "strict-origin-when-cross-origin" }
            };
        }
    }
}
