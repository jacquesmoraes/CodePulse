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

          // Verificar se já existe outro perfil com o mesmo UserName
          if (request.UserName != profile.UserName)
          {
              var existingProfile = await _context.UsersProfiles
                  .FirstOrDefaultAsync(p => p.UserName.ToLower() == request.UserName.ToLower() && p.Id != userId);

              if (existingProfile != null)
              {
                  throw new ArgumentException("Nome de usuário já está em uso.");
              }
          }

          // Atualizar os campos do perfil
          profile.FullName = request.FullName;
          profile.UserName = request.UserName;
          profile.Bio = request.Bio;

          if (request.ImageFile != null)
          {
              // Apaga imagem antiga, se houver
              if (profile.Image != null)
              {
                  var oldPath = Path.Combine(_environment.WebRootPath, profile.Image.Url);
                  if (File.Exists(oldPath))
                      File.Delete(oldPath);

                  _context.UserImageProfiles.Remove(profile.Image);
              }

              // Salva nova imagem
              var newImage = await _userImageRepository.SaveUserImageAsync(request.ImageFile);
              profile.ImageId = newImage.Id;
              profile.Image = newImage;
          }

          await _context.SaveChangesAsync();
          await transaction.CommitAsync();

          // Mapear para o DTO de resposta simplificado
          return new UpdateUserProfileResponseDto
          {
              UserId = profile.Id,
              FullName = profile.FullName,
              UserName = profile.UserName,
              Bio = profile.Bio,
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

    public async Task DeleteUserProfileAsync(string userId)
    {
      var profile = await _context.UsersProfiles.FirstOrDefaultAsync(p => p.Id == userId);
      if (profile != null)
      {
        _context.UsersProfiles.Remove(profile);
      }

      var user = await _userManager.FindByIdAsync(userId);
      if (user != null)
      {
        await _userManager.DeleteAsync(user);
      }

      await _context.SaveChangesAsync();
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
