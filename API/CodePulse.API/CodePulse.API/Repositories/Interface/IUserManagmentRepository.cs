using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using System.Security.Claims;

namespace CodePulse.API.Repositories.Interface
{
  public interface IUserManagmentRepository
  {
     Task<UserProfileDto> CreateUserAsync(UserProfile userProfile, string password, string email, string role);
    Task<List<UserProfileDto>> GetAllUsersAsync();
    Task<UserProfileDto?> GetWriterByIdAsync(string userId);
    Task<UserProfileDto?> UpdateUserRoleAsync(string userId, string newRole);
    
    Task<UserProfileDto?> RemoveUserAsync(string userIdToRemove, ClaimsPrincipal currentUser);
    Task<bool> IsUserWriterAsync(string userId);
  }
}
