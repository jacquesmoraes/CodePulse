using CodePulse.API.Models.Domain;

namespace CodePulse.API.Repositories.Interface
{
  public interface IUserImageProfileRepository
  {
    Task<UserImageProfile> SaveUserImageAsync ( IFormFile file);
  }
}
