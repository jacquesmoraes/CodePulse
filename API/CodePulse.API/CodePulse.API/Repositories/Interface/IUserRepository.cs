using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using Microsoft.AspNetCore.Identity;

namespace CodePulse.API.Repositories.Interface
{
    public interface IUserRepository
    {
        Task<IdentityResult> CreateUserAsync(IdentityUser user, string password);
        Task<bool> AssignRoleAsync(IdentityUser user, string role);
        Task CreateUserProfileAsync(UserProfile profile);
        Task<UserProfileDto?> GetUserProfileByUserIdAsync(string userId);
        Task<UserProfile> UpdateUserProfileAsync(string userId, UpdateUserProfileRequestDto request);
        Task DeleteUserProfileAsync(string userId);
        Task<List<UserProfileDto>> GetAllProfilesAsync();
   
    }
}
