
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
    private readonly IWebHostEnvironment _environment;
    private readonly IUserImageProfileRepository _userImageRepository;

    public UserRepository ( UserManager<IdentityUser> userManager, AuthContext context,
      IWebHostEnvironment environment, IUserImageProfileRepository userImageRepository )
    {
      _userManager = userManager;
      _context = context;
      _environment = environment;
      _userImageRepository = userImageRepository;
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
                .Include(x=> x.Image)
                .Include(p=> p.User)
                .AsNoTracking()
                .FirstOrDefaultAsync(p => p.UserId == userId);

      if ( profile == null ) return null;

      return new UserProfileDto
      {
        UserId = profile.UserId,
        UserName = profile.User?.UserName,
        Email = profile.User?.Email,
        FullName = profile.FullName,
        Bio = profile.Bio,
        ImageUrl = profile.Image?.Url
      };
    }

    public async Task<UserProfile?> UpdateUserProfileAsync ( string userId, UpdateUserProfileRequestDto request )
    {
      var profile = await _context.UsersProfiles
        .Include(p => p.Image)
        .FirstOrDefaultAsync(p => p.UserId == userId);
      var existingProfile = await _context.UsersProfiles
    .FirstOrDefaultAsync(p => p.UserName == request.UserName && p.UserId != userId);

      if ( existingProfile != null )
      {
        throw new ArgumentException ( "Nome de usuário já está em uso." );
      }

      if ( profile == null )
        return null;

      profile.FullName = request.FullName;
      profile.Bio = request.Bio;

      if ( request.ImageFile != null )
      {
        // Apaga imagem antiga, se houver
        if ( profile.Image != null )
        {
          var oldPath = Path.Combine(_environment.WebRootPath, profile.Image.Url);
          if ( File.Exists ( oldPath ) )
            File.Delete ( oldPath );

          _context.userImageProfiles.Remove ( profile.Image );
        }

        // Salva nova imagem
        var newImage = await _userImageRepository.SaveUserImageAsync(request.ImageFile);
        profile.ImageId = newImage.Id;
        profile.Image = newImage;
      }

      await _context.SaveChangesAsync ( );
      Console.WriteLine ( $"Salvando ImageId: {profile.ImageId}" );
      return profile;
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
          .Include ( p => p.Image )
          .Include ( p => p.User )
          .Select ( p => new UserProfileDto
          {
            UserId = p.UserId,
            UserName = p.User.UserName,
            Email = p.User.Email,
            FullName = p.FullName,
            Bio = p.Bio,
            ImageUrl = p.Image != null ? p.Image.Url : null
          } )
          .ToListAsync ( );
    }


  }
}
