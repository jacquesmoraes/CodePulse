using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;

namespace CodePulse.API.Repositories.Interface
{
  public interface IUserManagmentRepository
  {
     Task<UserProfile> CreateWriterAsync(UserProfile userProfile, string password, string email);
    Task<List<UserProfile>> GetAllWritersAsync();
    Task<UserProfile?> GetWriterByIdAsync(string userId);
    Task<UserProfile?> UpdateWriterAsync(string userId, UserProfile userProfile);
    Task<UserProfile?> RemoveWriterAsync(string userId);
    Task<bool> IsUserWriterAsync(string userId);
  }
}
