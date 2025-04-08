using CodePulse.API.Data;
using CodePulse.API.Models.Domain;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

public class UserManagementRepository : IUserManagmentRepository
{
    private readonly UserManager<UserProfile> _userManager;
    private readonly AuthContext _context;

    public UserManagementRepository(
        UserManager<UserProfile> userManager,
        AuthContext context)
    {
        _userManager = userManager;
        _context = context;
    }

    public async Task<UserProfile> CreateWriterAsync(UserProfile userProfile, string password, string email, string role)
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

            var roleResult = await _userManager.AddToRoleAsync(userProfile, role);
            if (!roleResult.Succeeded)
            {
                await _userManager.DeleteAsync(userProfile);
                throw new ApplicationException($"Falha ao atribuir papel de {role}");
            }

            await transaction.CommitAsync();

            return await _userManager.FindByIdAsync(userProfile.Id);
        }
        catch
        {
            await transaction.RollbackAsync();
            throw;
        }
    }

    public async Task<List<UserProfile>> GetAllWritersAsync()
    {
        return (await _userManager.GetUsersInRoleAsync("Writer")).ToList();
    }

    public async Task<UserProfile?> GetWriterByIdAsync(string userId)
    {
        if (!await IsUserWriterAsync(userId))
            return null;

        return await _userManager.FindByIdAsync(userId);
    }

    public async Task<UserProfile?> UpdateUserRoleAsync(string userId, string newRole)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();
        try
        {
            var user = await _userManager.FindByIdAsync(userId);
            if (user == null)
                return null;

            // Verificar se o novo role é válido
            if (newRole != "Writer" && newRole != "User")
                throw new ApplicationException("Role inválido. Use 'Writer' ou 'User'.");

            // Obter os roles atuais do usuário
            var currentRoles = await _userManager.GetRolesAsync(user);

            // Remover todos os roles atuais
            var removeResult = await _userManager.RemoveFromRolesAsync(user, currentRoles);
            if (!removeResult.Succeeded)
                throw new ApplicationException("Falha ao remover roles atuais: " + string.Join(", ", removeResult.Errors.Select(e => e.Description)));

            // Adicionar o novo role
            var addResult = await _userManager.AddToRoleAsync(user, newRole);
            if (!addResult.Succeeded)
                throw new ApplicationException("Falha ao adicionar novo role: " + string.Join(", ", addResult.Errors.Select(e => e.Description)));

            await transaction.CommitAsync();
            return user;
        }
        catch
        {
            await transaction.RollbackAsync();
            throw;
        }
    }

    public async Task<UserProfile?> RemoveWriterAsync(string userId)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();
        try
        {
            var user = await _userManager.FindByIdAsync(userId);
            if (user == null || !await IsUserWriterAsync(userId))
                return null;

            var result = await _userManager.RemoveFromRoleAsync(user, "Writer");
            if (!result.Succeeded)
                throw new ApplicationException("Falha ao remover papel de Writer");

            await transaction.CommitAsync();
            return user;
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
        if (user == null)
            return false;

        return await _userManager.IsInRoleAsync(user, "Writer");
    }
}
