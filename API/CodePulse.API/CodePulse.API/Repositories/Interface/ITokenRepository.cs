using CodePulse.API.Models.Domain;

namespace CodePulse.API.Repositories.Interface
{
  public interface ITokenRepository
  {
    public string CreateJwtToken(UserProfile user, List<string> roles );
  }
}
