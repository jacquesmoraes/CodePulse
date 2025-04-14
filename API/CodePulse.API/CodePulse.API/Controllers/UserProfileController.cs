using CodePulse.API.Data;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using AutoMapper;
using Microsoft.EntityFrameworkCore;

[Route("api/[controller]")]
[ApiController]
public class UserProfileController : ControllerBase
{
    private readonly IUserRepository _userRepository;
    private readonly AuthContext _authContext;
    private readonly UserManager<UserProfile> _userManager;
  

    public UserProfileController(
        IUserRepository userRepository,
        AuthContext authContext,
        UserManager<UserProfile> userManager,
        IUserImageProfileRepository userImageRepository,
        IMapper mapper)
    {
        _userRepository = userRepository;
        _authContext = authContext;
        _userManager = userManager;
    
    }

    // Endpoint público para visualizar perfil de qualquer usuário
    [HttpGet("{userId}")]
    public async Task<IActionResult> GetUserProfile(string userId)
    {
        var profile = await _userRepository.GetUserProfileByUserIdAsync(userId);
        if (profile == null)
            return NotFound("Perfil não encontrado.");

        return Ok(profile);
    }


  //endpoint publico pra visualizar um usuario pelo username
    [HttpGet("public/{username}")]
    public async Task<IActionResult> GetProfileByUserName(string username)
    {
        var profile = await _userRepository.GetUserProfileByUserNameAsync(username);
        if (profile == null)
            return NotFound("Perfil não encontrado.");

        return Ok(profile);
    }



    // Endpoint para usuário autenticado ver seu próprio perfil
    [HttpGet("me")]
    [Authorize]
    public async Task<IActionResult> GetMyProfile()
    {
               
        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
        
        
        if (string.IsNullOrEmpty(userId))
        {
            
            return Unauthorized("Token inválido ou expirado");
        }
        
        var profile = await _userRepository.GetUserProfileByUserIdAsync(userId);
        

        if (profile == null)
        {
            // Se não existir, criar um perfil padrão
            var user = await _userManager.FindByIdAsync(userId);
            
            
            if (user != null)
            {
                // Verificar se já existe um perfil com este username
                var existingProfile = await _authContext.UsersProfiles
                    .FirstOrDefaultAsync(p => p.UserName.ToLower() == user.UserName.ToLower());
                
                if (existingProfile != null)
                {
                    
                    return BadRequest($"Já existe um perfil com o username {user.UserName}. Por favor, escolha outro username.");
                }

                var newProfile = new UserProfile
                {
                    FullName = user.UserName, // Pode ser atualizado depois
                    UserName = user.UserName,
                    Email = user.Email,
                    Bio = null
                };

                await _userRepository.CreateUserProfileAsync(newProfile);
               
                
                // Buscar o perfil recém-criado
                profile = await _userRepository.GetUserProfileByUserIdAsync(userId);
                
            }
        }

        if (profile == null)
        {
           
            return NotFound("Perfil não encontrado.");
        }

        
        return Ok(profile);
    }


    // Endpoint para usuário autenticado atualizar seu próprio perfil
    [HttpPut("me")]
[Authorize]
public async Task<IActionResult> UpdateMyProfile([FromForm] UpdateUserProfileRequestDto request)
{
    var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;

    if (string.IsNullOrEmpty(userId))
        return Unauthorized();

    try
    {
        var updatedProfile = await _userRepository.UpdateUserProfileAsync(userId, request);

        if (updatedProfile == null)
            return NotFound();

        return Ok(updatedProfile); // já mapeado como DTO no repositório
    }
    catch (ArgumentException ex)
    {
        return BadRequest(ex.Message);
    }
    catch (Exception)
    {
        return StatusCode(500, "Erro interno ao atualizar perfil");
    }
}


  


  //endpoint pro usuario alterar a senha
  [HttpPut("update-password")]
  [Authorize]

public async Task<IActionResult> UpdatePassword([FromBody] UpdateUserCredentialsDto credentials)
{
    var user = await _userManager.GetUserAsync(User);
    if (user == null)
        return Unauthorized("Usuário não encontrado.");

    if (string.IsNullOrWhiteSpace(credentials.CurrentPassword) || 
        string.IsNullOrWhiteSpace(credentials.NewPassword))
    {
        return BadRequest("A senha atual e a nova senha são obrigatórias.");
    }

    var result = await _userManager.ChangePasswordAsync(user, credentials.CurrentPassword, credentials.NewPassword);
    if (!result.Succeeded)
    {
        var errors = string.Join("; ", result.Errors.Select(e => e.Description));
        return BadRequest(errors); // exibe mensagens detalhadas
    }

    return NoContent();
}


  // Endpoint para usuário autenticado deletar seu próprio perfil
    [HttpDelete("me")]
[Authorize]
public async Task<IActionResult> DeleteMyProfile()
{
    var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

    var deleted = await _userRepository.DeleteUserProfileAsync(userId);

    if (!deleted)
    {
        return NotFound("Perfil não encontrado ou já foi excluído.");
    }

    return NoContent();
}




  // Lista todos os writers (público)
    [HttpGet("writers")]
    public async Task<IActionResult> GetAllWriters()
    {
        var writers = await _userManager.GetUsersInRoleAsync("Writer");
        var writerIds = writers.Select(w => w.Id).ToList();

        var writerProfiles = await _authContext.UsersProfiles
            .Include(p => p.Image)
            .Where(p => writerIds.Contains(p.Id))
            .Select(p => new UserProfileDto
            {
                Id = p.Id,
                UserName = p.UserName,
                Email = p.Email,
                FullName = p.FullName,
                Bio = p.Bio,
                ImageUrl = p.Image != null ? p.Image.Url : null
            })
            .ToListAsync();

        return Ok(writerProfiles);
    }
}
