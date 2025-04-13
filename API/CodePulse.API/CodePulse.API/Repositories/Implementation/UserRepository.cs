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
    private readonly UserManager<UserProfile> _userManager;
    private readonly AuthContext _context;
    private readonly IWebHostEnvironment _environment;
    private readonly IUserImageProfileRepository _userImageRepository;
    private readonly ILogger<UserRepository> _logger;

    public UserRepository(
      UserManager<UserProfile> userManager,
      AuthContext context,
      IWebHostEnvironment environment,
      IUserImageProfileRepository userImageRepository,
      ILogger<UserRepository> logger)
    {
      _userManager = userManager;
      _context = context;
      _environment = environment;
      _userImageRepository = userImageRepository;
      _logger = logger;
    }

    public async Task<IdentityResult> CreateUserAsync(UserProfile user, string password)
    {
      return await _userManager.CreateAsync(user, password);
    }

    public async Task<bool> AssignRoleAsync(UserProfile user, string role)
    {
      var result = await _userManager.AddToRoleAsync(user, role);
      return result.Succeeded;
    }

    public async Task CreateUserProfileAsync(UserProfile profile)
    {
      await _context.UsersProfiles.AddAsync(profile);
      await _context.SaveChangesAsync();
    }

    public async Task<UserProfileDto?> GetUserProfileByUserIdAsync(string userId)
    {
      _logger.LogInformation($"Buscando perfil no repositório para userId: {userId}");
      
      var profile = await _context.UsersProfiles
          .Include(x => x.Image)
          .AsNoTracking()
          .FirstOrDefaultAsync(p => p.Id == userId);

      if (profile == null)
      {
          _logger.LogWarning($"Perfil não encontrado para userId: {userId}");
          return null;
      }

      return new UserProfileDto
      {
          Id = profile.Id,
          UserName = profile.UserName,
          Email = profile.Email,
          FullName = profile.FullName,
          Bio = profile.Bio,
          Interests = profile.Interests,
          ImageUrl = profile.Image?.Url
      };
    }

    public async Task<UpdateUserProfileResponseDto?> UpdateUserProfileAsync(string userId, UpdateUserProfileRequestDto request)
{
    using var transaction = await _context.Database.BeginTransactionAsync();
    try
    {
        var profile = await _context.UsersProfiles
            .Include(p => p.Image)
            .FirstOrDefaultAsync(p => p.Id == userId);

        if (profile == null)
            return null;

        // Atualizações condicionais
        if (!string.IsNullOrWhiteSpace(request.FullName))
            profile.FullName = request.FullName;

        if (!string.IsNullOrWhiteSpace(request.UserName) && request.UserName != profile.UserName)
        {
            var existingProfile = await _context.UsersProfiles
                .FirstOrDefaultAsync(p => p.UserName.ToLower() == request.UserName.ToLower() && p.Id != userId);

            if (existingProfile != null)
                throw new ArgumentException("Nome de usuário já está em uso.");

            profile.UserName = request.UserName;
        }

        if (!string.IsNullOrWhiteSpace(request.Bio))
            profile.Bio = request.Bio;

        if (!string.IsNullOrWhiteSpace(request.Interests))
            profile.Interests = request.Interests;

        // Atualização da imagem, se fornecida
        if (request.ImageFile != null)
        {
            if (profile.Image != null)
            {
                var oldPath = Path.Combine(_environment.WebRootPath, profile.Image.Url);
                if (File.Exists(oldPath))
                    File.Delete(oldPath);

                _context.UserImageProfiles.Remove(profile.Image);
            }

            var newImage = await _userImageRepository.SaveUserImageAsync(request.ImageFile);
            profile.ImageId = newImage.Id;
            profile.Image = newImage;
        }

        await _context.SaveChangesAsync();
        await transaction.CommitAsync();

        return new UpdateUserProfileResponseDto
        {
            UserId = profile.Id,
            FullName = profile.FullName,
            UserName = profile.UserName,
            Bio = profile.Bio,
            Interests = profile.Interests,
            Image = profile.Image != null ? new UserImageProfileDto
            {
                Id = profile.Image.Id,
                FileName = profile.Image.FileName,
                FileExtension = profile.Image.FileExtension,
                Url = profile.Image.Url
            } : null
        };
    }
    catch
    {
        await transaction.RollbackAsync();
        throw;
    }
}

   public async Task<bool> DeleteUserProfileAsync(string userId)
{
    using var transaction = await _context.Database.BeginTransactionAsync();

    try
    {
        var profile = await _context.UsersProfiles
            .Include(p => p.Image)
            .FirstOrDefaultAsync(p => p.Id == userId);

        if (profile == null)
            return false;

        // Deleta imagem do disco e do banco
        if (profile.Image != null)
        {
            var imagePath = Path.Combine(_environment.WebRootPath, profile.Image.Url);
            if (File.Exists(imagePath))
                File.Delete(imagePath);

            _context.UserImageProfiles.Remove(profile.Image);
        }

        _context.UsersProfiles.Remove(profile);
        await _context.SaveChangesAsync();
        await transaction.CommitAsync();

        return true;
    }
    catch
    {
        await transaction.RollbackAsync();
        throw;
    }
}

    public async Task<UserProfileDto?> GetUserProfileByUserNameAsync(string username)
    {
      var profile = await _context.UsersProfiles
          .Include(x => x.Image)
          .AsNoTracking()
          .FirstOrDefaultAsync(p => p.UserName.ToLower() == username.ToLower());

      if (profile == null)
          return null;

      return new UserProfileDto
      {
          Id = profile.Id,
          UserName = profile.UserName,
          Email = profile.Email,
          FullName = profile.FullName,
          Bio = profile.Bio,
          Interests = profile.Interests,
          ImageUrl = profile.Image?.Url
      };
    }

    public async Task<List<UserProfileDto>> GetAllProfilesAsync()
    {
      return await _context.UsersProfiles
          .Include(p => p.Image)
          .Select(p => new UserProfileDto
          {
            Id = p.Id,
            UserName = p.UserName,
            Email = p.Email,
            FullName = p.FullName,
            Bio = p.Bio,
            Interests = p.Interests,
            ImageUrl = p.Image != null ? p.Image.Url : null
          })
          .ToListAsync();
    }

    public async Task<UserProfile?> GetUserProfileByIdentityUserIdAsync(string userId)
    {
      return await _context.UsersProfiles
          .FirstOrDefaultAsync(p => p.Id == userId);
    }

   
}
}
