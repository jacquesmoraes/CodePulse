
using CodePulse.API.Data;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

[Route ( "api/[controller]" )]
[ApiController]
public class UserProfileController : ControllerBase
{
  private readonly IUserRepository _userRepository;
  private readonly AuthContext _authContext;

  public UserProfileController ( IUserRepository userRepository, AuthContext authContext )
  {
    _userRepository = userRepository;
    _authContext = authContext;
  }

  [HttpGet ( "me" )]
  [Authorize]
  public async Task<IActionResult> GetMyProfile ( )
  {
    var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
    var profile = await _userRepository.GetUserProfileByUserIdAsync(userId);

    if ( profile == null )
      return NotFound ( "Perfil não encontrado." );

    return Ok ( profile );
  }

  [HttpPut("me")]
[Authorize]
public async Task<IActionResult> UpdateMyProfile([FromForm] UpdateUserProfileRequestDto request)
{
    var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
    var updatedProfile = await _userRepository.UpdateUserProfileAsync(userId, request);

    if (updatedProfile == null)
        return NotFound("Perfil não encontrado.");

    return Ok(updatedProfile);
}


  [HttpDelete ( "me" )]
  [Authorize]
  public async Task<IActionResult> DeleteMyProfile ( )
  {
    var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

    await _userRepository.DeleteUserProfileAsync ( userId );

    return Ok ( "Usuário e perfil removidos com sucesso." );
  }

  [HttpGet ( "all" )]
  [Authorize ( Roles = "Writer" )]
  public async Task<IActionResult> GetAllProfiles ( )
  {
    var profiles = await _userRepository.GetAllProfilesAsync();
    return Ok ( profiles );
  }
}




