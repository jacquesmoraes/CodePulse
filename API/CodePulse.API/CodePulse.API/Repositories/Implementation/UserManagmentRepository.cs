using CodePulse.API.Data;
using CodePulse.API.Models.Domain;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

public class UserManagementRepository : IUserManagmentRepository
{
    private readonly UserManager<IdentityUser> _userManager;
    private readonly AuthContext _context;

    public UserManagementRepository(
        UserManager<IdentityUser> userManager,
        AuthContext context)
    {
        _userManager = userManager;
        _context = context;
    }

    public async Task<UserProfile> CreateWriterAsync(UserProfile userProfile, string password, string email)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();
        try
        {
            userProfile.UserName = userProfile.UserName.Replace(" ", "");
        
            var user = new IdentityUser
            {
                UserName = userProfile.UserName,
                Email = email,
                EmailConfirmed = true,
                NormalizedUserName = userProfile.UserName.ToUpper(),
                NormalizedEmail = email.ToUpper()
            };

            var result = await _userManager.CreateAsync(user, password);
            if (!result.Succeeded)
                throw new ApplicationException("Falha ao criar usuário: " + string.Join(", ", result.Errors.Select(e => e.Description)));

            var roleResult = await _userManager.AddToRoleAsync(user, "Writer");
            if (!roleResult.Succeeded)
            {
                await _userManager.DeleteAsync(user);
                throw new ApplicationException("Falha ao atribuir papel de Writer");
            }

            userProfile.UserId = user.Id;

            await _context.UsersProfiles.AddAsync(userProfile);
            await _context.SaveChangesAsync();

            await transaction.CommitAsync();

            return await _context.UsersProfiles
                .Include(p => p.User)
                .Include(p => p.Image)
                .FirstAsync(p => p.Id == userProfile.Id);
        }
        catch
        {
            await transaction.RollbackAsync();
            throw;
        }
    }

    public async Task<List<UserProfile>> GetAllWritersAsync()
    {
        var writers = await _userManager.GetUsersInRoleAsync("Writer");
        
        return await _context.UsersProfiles
            .Include(p => p.User)
            .Include(p => p.Image)
            .Where(p => writers.Select(w => w.Id).Contains(p.UserId))
            .ToListAsync();
    }

    public async Task<UserProfile?> GetWriterByIdAsync(string userId)
    {
        if (!await IsUserWriterAsync(userId))
            return null;

        return await _context.UsersProfiles
            .Include(p => p.User)
            .Include(p => p.Image)
            .FirstOrDefaultAsync(p => p.UserId == userId);
    }

    public async Task<UserProfile?> UpdateWriterAsync(string userId, UserProfile updatedProfile)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();
        try
        {
            var existingProfile = await _context.UsersProfiles
                .Include(p => p.User)
                .Include(p => p.Image)
                .FirstOrDefaultAsync(p => p.UserId == userId);

            if (existingProfile == null || !await IsUserWriterAsync(userId))
                return null;

            existingProfile.FullName = updatedProfile.FullName;
            existingProfile.UserName = updatedProfile.UserName;
            existingProfile.Bio = updatedProfile.Bio;
            existingProfile.ImageId = updatedProfile.ImageId;

            var identityUser = await _userManager.FindByIdAsync(userId);
            if (identityUser != null && updatedProfile.User?.Email != null)
            {
                identityUser.Email = updatedProfile.User.Email;
                identityUser.UserName = updatedProfile.UserName;
                identityUser.NormalizedEmail = updatedProfile.User.Email.ToUpper();
                identityUser.NormalizedUserName = updatedProfile.UserName.ToUpper();

                var userUpdateResult = await _userManager.UpdateAsync(identityUser);
                if (!userUpdateResult.Succeeded)
                    throw new ApplicationException("Falha ao atualizar dados do usuário");
            }

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return existingProfile;
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
            var profile = await _context.UsersProfiles
                .Include(p => p.User)
                .Include(p => p.Image)
                .FirstOrDefaultAsync(p => p.UserId == userId);

            if (profile == null || !await IsUserWriterAsync(userId))
                return null;

            var user = await _userManager.FindByIdAsync(userId);
            if (user == null)
                return null;

            var roleResult = await _userManager.RemoveFromRoleAsync(user, "Writer");
            if (!roleResult.Succeeded)
                throw new ApplicationException("Falha ao remover papel de Writer");

            var userRoles = await _userManager.GetRolesAsync(user);
            if (!userRoles.Any())
            {
                _context.UsersProfiles.Remove(profile);

                if (profile.Image != null)
                    _context.UserImageProfiles.Remove(profile.Image);

                var deleteResult = await _userManager.DeleteAsync(user);
                if (!deleteResult.Succeeded)
                    throw new ApplicationException("Falha ao deletar usuário");
            }

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();

            return profile;
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
