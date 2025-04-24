namespace CodePulse.API.Extensions
{
  public class EmailTemplateServiceExtension
  {
    private readonly string _templatePath;

    public EmailTemplateServiceExtension(IWebHostEnvironment env)
    {
        _templatePath = Path.Combine(env.ContentRootPath, "Templates", "Email");
    }

    public async Task<string> GetResetPasswordTemplateAsync(string resetUrl)
    {
        var template = await File.ReadAllTextAsync(Path.Combine(_templatePath, "reset-password.html"));
        
        return template
            .Replace("{resetUrl}", resetUrl)
            .Replace("{year}", DateTime.Now.Year.ToString());
    }

    public async Task<string> GetPasswordChangedTemplateAsync(string userName)
{
    var template = await File.ReadAllTextAsync(Path.Combine(_templatePath, "passwordChanged.html"));
    
    return template
        .Replace("[USERNAME]", userName)
        .Replace("[DATE]", DateTime.Now.ToString("dd/MM/yyyy HH:mm"))
        .Replace("[YEAR]", DateTime.Now.Year.ToString())
        .Replace("[EMAIL]", userName)
        .Replace("[LOGIN_URL]", "https://seu-site.com/login"); // Ajuste para sua URL real
}


  }
}
