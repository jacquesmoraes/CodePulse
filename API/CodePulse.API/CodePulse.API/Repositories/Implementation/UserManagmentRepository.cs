using CodePulse.API.Data;
using CodePulse.API.Models.Domain;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

public class UserManagementRepository : IUserManagmentRepository
{
  private readonly UserManager<UserProfile> _userManager;
  private readonly IWebHostEnvironment _environment;
  private readonly ApplicationContext _appContext;
  private readonly AuthContext _context;

  public UserManagementRepository (
      UserManager<UserProfile> userManager,
      IWebHostEnvironment environment,
      ApplicationContext appContext,
      AuthContext context )
  {
    _userManager = userManager;
    _environment = environment;
    _appContext = appContext;
    _context = context;
  }

  public async Task<UserProfile> CreateUserAsync(UserProfile userProfile, string password, string email, string role)
{
    using var transaction = await _context.Database.BeginTransactionAsync();

    try
    {
        // Sanitiza e normaliza dados
        userProfile.UserName = userProfile.UserName.Replace(" ", "");
        userProfile.Email = email;
        userProfile.EmailConfirmed = true;
        userProfile.NormalizedUserName = userProfile.UserName.ToUpper();
        userProfile.NormalizedEmail = email.ToUpper();

        // Cria usuário no Identity
        var result = await _userManager.CreateAsync(userProfile, password);
        if (!result.Succeeded)
            throw new ApplicationException("Falha ao criar usuário: " + string.Join(", ", result.Errors.Select(e => e.Description)));

        // Valida role
        if (role != "Writer" && role != "Reader")
        {
            // Caso inválido, desfaz a criação
            await _userManager.DeleteAsync(userProfile);
            throw new ApplicationException("Role inválida. Use 'Writer' ou 'Reader'.");
        }

        // Atribui papel
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



  public async Task<List<UserProfile>> GetAllWritersAsync ( )
  {
    return ( await _userManager.GetUsersInRoleAsync ( "Writer" ) ).ToList ( );
  }

  public async Task<UserProfile?> GetWriterByIdAsync ( string userId )
  {
    if ( !await IsUserWriterAsync ( userId ) )
      return null;

    return await _userManager.FindByIdAsync ( userId );
  }

  public async Task<UserProfile?> UpdateUserRoleAsync ( string userId, string newRole )
  {
    using var transaction = await _context.Database.BeginTransactionAsync();
    try
    {
      var user = await _userManager.FindByIdAsync(userId);
      if ( user == null )
        return null;

      // Verificar se o novo role é válido
      if ( newRole != "Writer" && newRole != "User" )
        throw new ApplicationException ( "Role inválido. Use 'Writer' ou 'User'." );

      // Obter os roles atuais do usuário
      var currentRoles = await _userManager.GetRolesAsync(user);

      // Remover todos os roles atuais
      var removeResult = await _userManager.RemoveFromRolesAsync(user, currentRoles);
      if ( !removeResult.Succeeded )
        throw new ApplicationException ( "Falha ao remover roles atuais: " + string.Join ( ", ", removeResult.Errors.Select ( e => e.Description ) ) );

      // Adicionar o novo role
      var addResult = await _userManager.AddToRoleAsync(user, newRole);
      if ( !addResult.Succeeded )
        throw new ApplicationException ( "Falha ao adicionar novo role: " + string.Join ( ", ", addResult.Errors.Select ( e => e.Description ) ) );

      await transaction.CommitAsync ( );
      return user;
    }
    catch
    {
      await transaction.RollbackAsync ( );
      throw;
    }
  }


  public async Task<UserProfile?> RemoveUserAsync(string userIdToRemove, ClaimsPrincipal currentUser)
{
    using var transaction = await _context.Database.BeginTransactionAsync();

    try
    {
        // ID do usuário logado
        var loggedUserId = currentUser.FindFirstValue(ClaimTypes.NameIdentifier);
        var isAdmin = currentUser.IsInRole("Admin");

        // Se não for admin, só pode deletar a si mesmo
        if (!isAdmin && userIdToRemove != loggedUserId)
            throw new UnauthorizedAccessException("Você não tem permissão para remover este perfil.");

        // Busca o usuário alvo
        var user = await _userManager.FindByIdAsync(userIdToRemove);
        if (user == null)
            return null;

        var roles = await _userManager.GetRolesAsync(user);
        var isWriter = roles.Contains("Writer");

        // Se for Writer, limpa dependências (imagem + posts)
        if (isWriter)
        {
            var profile = await _appContext.UsersProfiles
                .AsNoTracking()
                .Include(p => p.Image)
                .Include(p => p.BlogPosts)
                .FirstOrDefaultAsync(p => p.Id == userIdToRemove);

            if (profile?.Image != null)
            {
                var imagePath = Path.Combine(_environment.WebRootPath, profile.Image.Url);
                if (File.Exists(imagePath))
                    File.Delete(imagePath);

                _appContext.UserImageProfiles.Remove(profile.Image);
            }

            if (profile?.BlogPosts != null && profile.BlogPosts.Any())
            {
                _appContext.BlogPosts.RemoveRange(profile.BlogPosts);
            }

            await _appContext.SaveChangesAsync();
        }

        // Remove roles
        if (roles.Any())
        {
            var removeRolesResult = await _userManager.RemoveFromRolesAsync(user, roles);
            if (!removeRolesResult.Succeeded)
                throw new ApplicationException("Erro ao remover papéis do usuário.");
        }

        // Remove usuário
        var deleteResult = await _userManager.DeleteAsync(user);
        if (!deleteResult.Succeeded)
            throw new ApplicationException("Erro ao excluir o usuário.");

        await transaction.CommitAsync();
        return user;
    }
    catch (UnauthorizedAccessException ex)
    {
        throw; // deixar o controller retornar 403
    }
    catch (Exception ex)
    {
        await transaction.RollbackAsync();
        throw new ApplicationException("Erro ao remover usuário: " + ex.Message, ex);
    }
}





  public async Task<bool> IsUserWriterAsync ( string userId )
  {
    var user = await _userManager.FindByIdAsync(userId);
    if ( user == null )
      return false;

    return await _userManager.IsInRoleAsync ( user, "Writer" );
  }
}
