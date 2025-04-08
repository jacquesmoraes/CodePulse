using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;

namespace CodePulse.API.Repositories.Interface
{
  public interface IUserManagmentRepository
  {
     Task<UserProfile> CreateWriterAsync(UserProfile userProfile, string password, string email, string role);
    Task<List<UserProfile>> GetAllWritersAsync();
    Task<UserProfile?> GetWriterByIdAsync(string userId);
    Task<UserProfile?> UpdateUserRoleAsync(string userId, string newRole);
    Task<UserProfile?> RemoveWriterAsync(string userId);
    Task<bool> IsUserWriterAsync(string userId);
  }
}
