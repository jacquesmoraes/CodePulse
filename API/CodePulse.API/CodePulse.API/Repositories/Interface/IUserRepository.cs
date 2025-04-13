using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using Microsoft.AspNetCore.Identity;

namespace CodePulse.API.Repositories.Interface
{
    public interface IUserRepository
    {
        Task<IdentityResult> CreateUserAsync(UserProfile user, string password);
        Task<bool> AssignRoleAsync(UserProfile user, string role);
        Task CreateUserProfileAsync(UserProfile profile);
        Task<UserProfileDto?> GetUserProfileByUserIdAsync(string userId);
        Task<UpdateUserProfileResponseDto?> UpdateUserProfileAsync(string userId, UpdateUserProfileRequestDto request);
    


        Task<bool> DeleteUserProfileAsync(string userId);
        Task<UserProfileDto?> GetUserProfileByUserNameAsync(string username);
        Task<List<UserProfileDto>> GetAllProfilesAsync();
        Task<UserProfile?> GetUserProfileByIdentityUserIdAsync(string userId);
    }
}
