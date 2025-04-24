namespace CodePulse.API.Repositories.Interface.Service
{
  public interface IEmailService
  {
    public Task SendAsync(string to, string subject, string htmlBody);
  }
}
