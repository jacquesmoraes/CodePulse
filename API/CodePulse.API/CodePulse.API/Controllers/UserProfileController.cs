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
    private readonly ILogger<UserProfileController> _logger;
    private readonly IMapper _mapper;

    public UserProfileController(
        IUserRepository userRepository,
        AuthContext authContext,
        UserManager<UserProfile> userManager,
        ILogger<UserProfileController> logger,
        IMapper mapper)
    {
        _userRepository = userRepository;
        _authContext = authContext;
        _userManager = userManager;
        _logger = logger;
        _mapper = mapper;
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
        _logger.LogInformation($"UserId extraído do token: {userId}");
        
        if (string.IsNullOrEmpty(userId))
        {
            _logger.LogWarning("UserId não encontrado no token");
            return Unauthorized("Token inválido ou expirado");
        }
        
        var profile = await _userRepository.GetUserProfileByUserIdAsync(userId);
        _logger.LogInformation($"Perfil encontrado: {profile != null}");

        if (profile == null)
        {
            // Se não existir, criar um perfil padrão
            var user = await _userManager.FindByIdAsync(userId);
            _logger.LogInformation($"Usuário encontrado no Identity: {user != null}");
            
            if (user != null)
            {
                // Verificar se já existe um perfil com este username
                var existingProfile = await _authContext.UsersProfiles
                    .FirstOrDefaultAsync(p => p.UserName.ToLower() == user.UserName.ToLower());
                
                if (existingProfile != null)
                {
                    _logger.LogWarning($"Já existe um perfil com o username {user.UserName}, mas com userId diferente");
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
                _logger.LogInformation("Perfil padrão criado com sucesso");
                
                // Buscar o perfil recém-criado
                profile = await _userRepository.GetUserProfileByUserIdAsync(userId);
                _logger.LogInformation($"Perfil recém-criado encontrado: {profile != null}");
            }
        }

        if (profile == null)
        {
            _logger.LogWarning("Perfil não encontrado após todas as tentativas");
            return NotFound("Perfil não encontrado.");
        }

        _logger.LogInformation("Retornando perfil com sucesso");
        return Ok(profile);
    }


    // Endpoint para usuário autenticado atualizar seu próprio perfil
    [HttpPut("me")]
    [Authorize]
    public async Task<IActionResult> UpdateMyProfile([FromForm] UpdateUserProfileRequestDto request)
    {
        _logger.LogInformation("Iniciando UpdateMyProfile");
        
        var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        _logger.LogInformation($"UserId extraído do token: {userId}");
        
        if (string.IsNullOrEmpty(userId))
        {
            _logger.LogWarning("UserId não encontrado no token");
            return Unauthorized();
        }

        _logger.LogInformation($"Dados recebidos: FullName={request.FullName}, UserName={request.UserName}, Bio={request.Bio}, ImageFile={request.ImageFile != null}");

        try
        {
            // Verificar se o perfil existe
            var existingProfile = await _userRepository.GetUserProfileByUserIdAsync(userId);
            if (existingProfile == null)
            {
                _logger.LogInformation("Perfil não encontrado, criando novo perfil");
                
                // Verificar se já existe um perfil com este username
                var profileWithSameUsername = await _authContext.UsersProfiles
                    .FirstOrDefaultAsync(p => p.UserName.ToLower() == request.UserName.ToLower());
                
                if (profileWithSameUsername != null)
                {
                    _logger.LogWarning($"Já existe um perfil com o username {request.UserName}");
                    return BadRequest($"Já existe um perfil com o username {request.UserName}. Por favor, escolha outro username.");
                }

                // Criar novo perfil
                var newProfile = new UserProfile
                {
                    FullName = request.FullName,
                    UserName = request.UserName,
                    Bio = request.Bio
                };

                await _userRepository.CreateUserProfileAsync(newProfile);
                _logger.LogInformation("Novo perfil criado com sucesso");
            }

            // Atualizar o perfil
            var updatedProfile = await _userRepository.UpdateUserProfileAsync(userId, request);
            _logger.LogInformation($"Perfil atualizado: {updatedProfile != null}");
            
            if (updatedProfile == null)
            {
                _logger.LogWarning("Perfil não encontrado para atualização");
                return NotFound();
            }

            // Buscar o perfil atualizado para retornar como UserProfileDto
            var profile = await _userRepository.GetUserProfileByUserIdAsync(userId);
            _logger.LogInformation($"Perfil buscado após atualização: {profile != null}");
            
            if (profile == null)
            {
                _logger.LogWarning("Perfil não encontrado após atualização");
                return NotFound();
            }

            _logger.LogInformation("Retornando perfil atualizado com sucesso");
            return Ok(profile);
        }
        catch (ArgumentException ex)
        {
            _logger.LogError($"Erro ao atualizar perfil: {ex.Message}");
            return BadRequest(ex.Message);
        }
        catch (Exception ex)
        {
            _logger.LogError($"Erro inesperado ao atualizar perfil: {ex}");
            return StatusCode(500, "Erro interno ao atualizar perfil");
        }
    }


  //endpoint pro usuario alterar a senha
  [HttpPut("update-password")]
  [Authorize]
  public async Task<IActionResult> UpdatePassword ( [FromBody] UpdateUserCredentialsDto credentials )
  {
    var user = await _userManager.GetUserAsync(User);
    if(user== null ) return Unauthorized("user not found");

    if(string.IsNullOrWhiteSpace(credentials.CurrentPassword) || string.IsNullOrWhiteSpace ( credentials.NewPassword ) )
    
      return BadRequest("senha atual e nova senha sao obrigatórias");
    
    var result = await _userManager.ChangePasswordAsync(user, credentials.CurrentPassword, credentials.NewPassword);
    if ( !result.Succeeded)
     return BadRequest("Erro ao alterar a senha. Verifique se a senha atual está correta e se a nova senha atende aos requisitos.");

    
    return NoContent();

  }


  // Endpoint para usuário autenticado deletar seu próprio perfil
    [HttpDelete("me")]
    [Authorize]
    public async Task<IActionResult> DeleteMyProfile()
    {
        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
        await _userRepository.DeleteUserProfileAsync(userId);
        return Ok("Usuário e perfil removidos com sucesso.");
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
