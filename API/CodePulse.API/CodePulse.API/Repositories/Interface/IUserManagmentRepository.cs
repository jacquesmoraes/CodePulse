using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using System.Security.Claims;

namespace CodePulse.API.Repositories.Interface
{
  public interface IUserManagmentRepository
  {
     Task<UserProfile> CreateUserAsync(UserProfile userProfile, string password, string email, string role);
    Task<List<UserProfile>> GetAllWritersAsync();
    Task<UserProfile?> GetWriterByIdAsync(string userId);
    Task<UserProfile?> UpdateUserRoleAsync(string userId, string newRole);
    
    Task<UserProfile?> RemoveUserAsync(string userIdToRemove, ClaimsPrincipal currentUser);
    Task<bool> IsUserWriterAsync(string userId);
  }
}
