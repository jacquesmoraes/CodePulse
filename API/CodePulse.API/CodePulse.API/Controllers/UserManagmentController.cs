using AutoMapper;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using CodePulse.API.Data;

[Route("api/[controller]")]
[ApiController]
[Authorize(Roles = "Admin")]
public class UserManagementController : ControllerBase
{
    private readonly IUserManagmentRepository _userManagementRepository;
    private readonly IMapper _mapper;
    private readonly AuthContext _context;
    private readonly UserManager<UserProfile> _userManager;

    public UserManagementController(
        IUserManagmentRepository userManagementRepository,
        IMapper mapper,
        AuthContext context,
        UserManager<UserProfile> userManager)
    {
        _userManagementRepository = userManagementRepository;
        _mapper = mapper;
        _context = context;
        _userManager = userManager;
    }

    [HttpPost("writers")]
    public async Task<IActionResult> CreateWriter([FromBody] CreateUserRequestDto request)
    {
        try
        {
            request.UserName = request.UserName.Replace(" ", "");
            
            // Verificar se o username já existe
            var existingProfile = await _context.UsersProfiles
                .FirstOrDefaultAsync(p => p.UserName.ToLower() == request.UserName.ToLower());
            
            if (existingProfile != null)
            {
                return BadRequest($"Username '{request.UserName}' já está em uso.");
            }

            // Verificar se a role é válida (apenas Writer ou User são permitidos)
            if (request.Role != "Writer" && request.Role != "User")
            {
                return BadRequest("Role inválido. Use 'Writer' ou 'User'.");
            }
        
            var userProfile = new UserProfile
            {
                FullName = request.FullName,
                UserName = request.UserName,
                Email = request.Email,
                Bio = request.Bio
            };

            var createdProfile = await _userManagementRepository.CreateWriterAsync(userProfile, request.Password, request.Email, request.Role);
            return Ok(_mapper.Map<UserProfileDto>(createdProfile));
        }
        catch (ApplicationException ex)
        {
            return BadRequest(ex.Message);
        }
    }

    [HttpGet("writers")]
    public async Task<IActionResult> GetAllWriters()
    {
        var writers = await _userManagementRepository.GetAllWritersAsync();
        return Ok(_mapper.Map<List<UserProfileDto>>(writers));
    }

    [HttpGet("writers/{userId}")]
    public async Task<IActionResult> GetWriter(string userId)
    {
        var writer = await _userManagementRepository.GetWriterByIdAsync(userId);
        if (writer == null)
            return NotFound("Writer não encontrado");

        return Ok(_mapper.Map<UserProfileDto>(writer));
    }

    [HttpPut("writers/{userId}/role")]
    public async Task<IActionResult> UpdateUserRole(string userId, [FromBody] UpdateUserRoleRequestDto request)
    {
        try
        {
            var updatedProfile = await _userManagementRepository.UpdateUserRoleAsync(userId, request.NewRole);
            if (updatedProfile == null)
                return NotFound("Usuário não encontrado");

            return Ok(_mapper.Map<UserProfileDto>(updatedProfile));
        }
        catch (ApplicationException ex)
        {
            return BadRequest(ex.Message);
        }
    }

    [HttpDelete("writers/{userId}")]
    public async Task<IActionResult> RemoveWriter(string userId)
    {
        var removedProfile = await _userManagementRepository.RemoveWriterAsync(userId);
        if (removedProfile == null)
            return NotFound("Writer não encontrado");

        return Ok(_mapper.Map<UserProfileDto>(removedProfile));
    }


}
