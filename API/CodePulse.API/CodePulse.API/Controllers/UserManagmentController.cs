using CodePulse.API.Data;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CodePulse.API.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  [Authorize(Roles = "Admin")]
  public class UserManagementController : ControllerBase
  {
    private readonly IUserManagmentRepository _userManagementRepository;
    private readonly UserManager<UserProfile> _userManager;
    private readonly AuthContext _context;

    public UserManagementController(
        IUserManagmentRepository userManagementRepository,
        UserManager<UserProfile> userManager,
        AuthContext context)
    {
      _userManagementRepository = userManagementRepository;
      _userManager = userManager;
      _context = context;
    }

    [HttpPost("users")]
    public async Task<IActionResult> CreateUser([FromBody] CreateUserRequestDto request)
    {
      try
      {
        request.UserName = request.UserName.Replace(" ", "");

        var existingProfile = await _context.UsersProfiles
            .FirstOrDefaultAsync(p => p.UserName.ToLower() == request.UserName.ToLower());

        if (existingProfile != null)
          return BadRequest($"Username '{request.UserName}' já está em uso.");

        if (request.Role != "Writer" && request.Role != "User")
          return BadRequest("Role inválido. Use 'Writer' ou 'User'.");

        var userProfile = new UserProfile
        {
          FullName = request.FullName,
          UserName = request.UserName,
          Email = request.Email,
          Bio = request.Bio,
          Interests = request.Interests
        };

        var createdProfileDto = await _userManagementRepository.CreateUserAsync(
            userProfile,
            request.Password,
            request.Email,
            request.Role);

        return Ok(createdProfileDto);
      }
      catch (ApplicationException ex)
      {
        return BadRequest(ex.Message);
      }
      catch (Exception ex)
      {
        return StatusCode(500, "Erro interno: " + ex.Message);
      }
    }

    [HttpPut("writers/{userId}/role")]
    public async Task<IActionResult> UpdateUserRole(string userId, [FromBody] UpdateUserRoleRequestDto request)
    {
      try
      {
        var updatedProfileDto = await _userManagementRepository.UpdateUserRoleAsync(userId, request.NewRole);
        if (updatedProfileDto == null)
          return NotFound("Usuário não encontrado");

        return Ok(updatedProfileDto);
      }
      catch (ApplicationException ex)
      {
        return BadRequest(ex.Message);
      }
    }

    [HttpGet("users")]
    public async Task<IActionResult> GetAllUsers()
    {
      var usersDto = await _userManagementRepository.GetAllUsersAsync();
      return Ok(usersDto);
    }

    [HttpGet("writers/{userId}")]
    public async Task<IActionResult> GetWriter(string userId)
    {
      var writerDto = await _userManagementRepository.GetWriterByIdAsync(userId);
      if (writerDto == null)
        return NotFound("Writer não encontrado");

      return Ok(writerDto);
    }

    [HttpDelete("users/{userId}")]
    [Authorize]
    public async Task<IActionResult> RemoveUser(string userId)
    {
      try
      {
        var removedDto = await _userManagementRepository.RemoveUserAsync(userId, User);
        if (removedDto == null)
          return NotFound("Usuário não encontrado");

        return NoContent();
      }
      catch (UnauthorizedAccessException)
      {
        return Forbid("Você não tem permissão para remover este perfil.");
      }
      catch (Exception ex)
      {
        return StatusCode(500, ex.Message);
      }
    }
  }
}
