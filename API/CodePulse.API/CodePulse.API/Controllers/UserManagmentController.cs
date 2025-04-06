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

    public UserManagementController(
        IUserManagmentRepository userManagementRepository,
        IMapper mapper,
        AuthContext context)
    {
        _userManagementRepository = userManagementRepository;
        _mapper = mapper;
        _context = context;
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
        
            var userProfile = new UserProfile
            {
                Id = Guid.NewGuid(),
                UserId = "temp", // Será substituído no repositório
                FullName = request.FullName,
                UserName = request.UserName,
                Bio = request.Bio
            };

            var createdProfile = await _userManagementRepository.CreateWriterAsync(userProfile, request.Password, request.Email);
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

    [HttpPut("writers/{userId}")]
    public async Task<IActionResult> UpdateWriter(string userId, [FromBody] UpdateUserRequestDto request)
    {
        try
        {
            var userProfile = new UserProfile
            {
                Id = Guid.NewGuid(), // Definir o Id do perfil
            UserId = userId, // Usar o userId fornecido
            FullName = request.FullName,
            UserName = request.UserName,
            Bio = request.Bio,
            ImageId = request.ImageId,
            User = new IdentityUser { Email = request.Email }
            };

            var updatedProfile = await _userManagementRepository.UpdateWriterAsync(userId, userProfile);
            if (updatedProfile == null)
                return NotFound("Writer não encontrado");

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
        try
        {
            var removedProfile = await _userManagementRepository.RemoveWriterAsync(userId);
            if (removedProfile == null)
                return NotFound("Writer não encontrado");

            return Ok(_mapper.Map<UserProfileDto>(removedProfile));
        }
        catch (ApplicationException ex)
        {
            return BadRequest(ex.Message);
        }
    }
}
