
using CodePulse.API.Data;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace CodePulse.API.Repositories.Implementation
{
  public class UserRepository : IUserRepository
  {
    private readonly UserManager<IdentityUser> _userManager;
    private readonly AuthContext _context;

    public UserRepository ( UserManager<IdentityUser> userManager, AuthContext context )
    {
      _userManager = userManager;
      _context = context;
    }

    public async Task<IdentityResult> CreateUserAsync ( IdentityUser user, string password )
    {
      return await _userManager.CreateAsync ( user, password );
    }

    public async Task<bool> AssignRoleAsync ( IdentityUser user, string role )
    {
      var result = await _userManager.AddToRoleAsync(user, role);
      return result.Succeeded;
    }

    public async Task CreateUserProfileAsync ( UserProfile profile )
    {
      await _context.UsersProfiles.AddAsync ( profile );
      await _context.SaveChangesAsync ( );

    }

    public async Task<UserProfileDto?> GetUserProfileByUserIdAsync ( string userId )
    {
      var profile = await _context.UsersProfiles
                .AsNoTracking()
                .FirstOrDefaultAsync(p => p.UserId == userId);

      if ( profile == null ) return null;

      return new UserProfileDto
      {
        UserId = profile.UserId,
        FullName = profile.FullName,
        Bio = profile.Bio,
        PhotoUrl = profile.PhotoUrl
      };
    }

    public async Task<bool> UpdateUserProfileAsync ( string userId, UpdateUserProfileRequestDto request )
    {
      var profile = await _context.UsersProfiles.FirstOrDefaultAsync(p => p.UserId == userId);
      if ( profile == null ) return false;

      profile.FullName = request.FullName;
      profile.Bio = request.Bio;
      profile.PhotoUrl = request.PhotoUrl;

      await _context.SaveChangesAsync ( );
      return true;
    }

    public async Task DeleteUserProfileAsync ( string userId )
    {
      
      var profile = await _context.UsersProfiles.FirstOrDefaultAsync(p => p.UserId == userId);
      if ( profile != null )
      {
        _context.UsersProfiles.Remove ( profile );
      }

   
      var user = await _userManager.FindByIdAsync(userId);
      if ( user != null )
      {
        await _userManager.DeleteAsync ( user );
      }

      await _context.SaveChangesAsync ( );
    }


    public async Task<List<UserProfileDto>> GetAllProfilesAsync ( )
    {
      return await _context.UsersProfiles
          .Select ( p => new UserProfileDto
          {
            UserId = p.UserId,
            FullName = p.FullName,
            Bio = p.Bio,
            PhotoUrl = p.PhotoUrl
          } ).ToListAsync ( );
    }
  }
}
