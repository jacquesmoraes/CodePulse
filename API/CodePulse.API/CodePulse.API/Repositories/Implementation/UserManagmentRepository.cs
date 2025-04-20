using CodePulse.API.Data;
using CodePulse.API.Helper;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace CodePulse.API.Repositories.Implementation;

public class UserManagementRepository : IUserManagmentRepository
{
    private readonly UserManager<UserProfile> _userManager;
    private readonly IWebHostEnvironment _environment;
    private readonly ApplicationContext _appContext;
    private readonly AuthContext _context;
    

    public UserManagementRepository(
        UserManager<UserProfile> userManager,
        IWebHostEnvironment environment,
        ApplicationContext appContext,
        AuthContext context
        )
    {
        _userManager = userManager;
        _environment = environment;
        _appContext = appContext;
        _context = context;
        
    }

    public async Task<UserProfileDto> CreateUserAsync(UserProfile userProfile, string password, string email, string role)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            userProfile.UserName = userProfile.UserName.Replace(" ", "");
            userProfile.Email = email;
            userProfile.EmailConfirmed = true;
            userProfile.NormalizedUserName = userProfile.UserName.ToUpper();
            userProfile.NormalizedEmail = email.ToUpper();

            var result = await _userManager.CreateAsync(userProfile, password);
            if (!result.Succeeded)
                throw new ApplicationException("Falha ao criar usuário: " + string.Join(", ", result.Errors.Select(e => e.Description)));

            if (role != "Writer" && role != "User")
            {
                await _userManager.DeleteAsync(userProfile);
                throw new ApplicationException("Role inválida. Use 'Writer' ou 'User'.");
            }

            var roleResult = await _userManager.AddToRoleAsync(userProfile, role);
            if (!roleResult.Succeeded)
            {
                await _userManager.DeleteAsync(userProfile);
                throw new ApplicationException($"Falha ao atribuir papel de {role}");
            }

            await transaction.CommitAsync();

            var createdUser = await _userManager.FindByIdAsync(userProfile.Id);
            return UserProfileMapperHelper.MapToDto(createdUser!, role);
        }
        catch
        {
            await transaction.RollbackAsync();
            throw;
        }
    }

    public async Task<List<UserProfileDto>> GetAllUsersAsync()
    {
        var users = await _userManager.Users.Include(p => p.Image).ToListAsync();
        var usersWithRoles = new List<UserProfileDto>();

        foreach (var user in users)
        {
            var roles = await _userManager.GetRolesAsync(user);
            usersWithRoles.Add(UserProfileMapperHelper.MapToDto(user, roles.FirstOrDefault()));
        }

        return usersWithRoles;
    }

    public async Task<UserProfileDto?> GetWriterByIdAsync(string userId)
    {
        var user = await _userManager.FindByIdAsync(userId);
        if (user == null || !await _userManager.IsInRoleAsync(user, "Writer"))
            return null;

        return UserProfileMapperHelper.MapToDto(user, "Writer");
    }

    public async Task<UserProfileDto?> UpdateUserRoleAsync(string userId, string newRole)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();
        try
        {
            var user = await _userManager.FindByIdAsync(userId);
            if (user == null) return null;

            if (newRole != "Writer" && newRole != "User")
                throw new ApplicationException("Role inválido. Use 'Writer' ou 'User'.");

            var currentRoles = await _userManager.GetRolesAsync(user);
            var removeResult = await _userManager.RemoveFromRolesAsync(user, currentRoles);
            if (!removeResult.Succeeded)
                throw new ApplicationException("Falha ao remover roles: " + string.Join(", ", removeResult.Errors.Select(e => e.Description)));

            var addResult = await _userManager.AddToRoleAsync(user, newRole);
            if (!addResult.Succeeded)
                throw new ApplicationException("Falha ao atribuir novo role: " + string.Join(", ", addResult.Errors.Select(e => e.Description)));

            await transaction.CommitAsync();
            return UserProfileMapperHelper.MapToDto(user, newRole);
        }
        catch
        {
            await transaction.RollbackAsync();
            throw;
        }
    }

    public async Task<UserProfileDto?> RemoveUserAsync(string userIdToRemove, ClaimsPrincipal currentUser)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();

        try
        {
            var loggedUserId = currentUser.FindFirstValue(ClaimTypes.NameIdentifier);
            var isAdmin = currentUser.IsInRole("Admin");

            if (!isAdmin && userIdToRemove != loggedUserId)
                throw new UnauthorizedAccessException("Você não tem permissão para remover este perfil.");

            var user = await _userManager.FindByIdAsync(userIdToRemove);
            if (user == null)
                return null;

            var roles = await _userManager.GetRolesAsync(user);
            var role = roles.FirstOrDefault();

            var favorites = await _appContext.FavoritePosts
                .Where(f => f.UserId == userIdToRemove)
                .ToListAsync();
            _appContext.FavoritePosts.RemoveRange(favorites);
            await _appContext.SaveChangesAsync();

            if (roles.Contains("Writer"))
            {
                var profile = await _appContext.UsersProfiles
                    .Include(p => p.Image)
                    .Include(p => p.BlogPosts)
                    .FirstOrDefaultAsync(p => p.Id == userIdToRemove);

                if (profile?.Image != null)
                {
                    var imagePath = Path.Combine(_environment.WebRootPath, profile.Image.Url);
                    if (File.Exists(imagePath)) File.Delete(imagePath);
                    _appContext.UserImageProfiles.Remove(profile.Image);
                }

                if (profile?.BlogPosts?.Any() == true)
                    _appContext.BlogPosts.RemoveRange(profile.BlogPosts);

                await _appContext.SaveChangesAsync();
            }

            if (roles.Any())
            {
                var removeRolesResult = await _userManager.RemoveFromRolesAsync(user, roles);
                if (!removeRolesResult.Succeeded)
                    throw new ApplicationException("Erro ao remover papéis do usuário.");
            }

            var deleteResult = await _userManager.DeleteAsync(user);
            if (!deleteResult.Succeeded)
                throw new ApplicationException("Erro ao excluir o usuário.");

            await transaction.CommitAsync();
            return UserProfileMapperHelper.MapToDto(user, role);
        }
        catch
        {
            await transaction.RollbackAsync();
            throw;
        }
    }

    public async Task<bool> IsUserWriterAsync(string userId)
    {
        var user = await _userManager.FindByIdAsync(userId);
        return user != null && await _userManager.IsInRoleAsync(user, "Writer");
    }
}
