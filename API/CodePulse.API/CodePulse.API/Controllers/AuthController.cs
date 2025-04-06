using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Implementation;
using CodePulse.API.Repositories.Interface;

using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace CodePulse.API.Controllers
{
  [Route ( "api/[controller]" )]
  [ApiController]
  public class AuthController : ControllerBase
  {
    private readonly UserManager<IdentityUser> _userManager;
    private readonly IUserRepository _userRepository;
    private readonly ITokenRepository _tokenRepository;

    public AuthController ( UserManager<IdentityUser> userManager,
      IUserRepository userRepository, ITokenRepository tokenRepository )
    {
      _userManager = userManager;
      _userRepository = userRepository;
      _tokenRepository = tokenRepository;
    }


    [HttpPost]
    [Route ( "login" )]
    public async Task<IActionResult> login ( [FromBody] LoginRequestDto request )
    {
      //check email
      var user = await _userManager.FindByEmailAsync(request.Email);
      if ( user is not null )
      {
        //check password
        var password = await _userManager.CheckPasswordAsync(user, request.Password);
        if ( password )
        {

          //create token and response
          var roles = await _userManager.GetRolesAsync(user);
          var jwtToken = _tokenRepository.CreateJwtToken(user, roles.ToList());
          var response = new LoginResponseDto
          {
            Email = request.Email,
            Roles = roles.ToList(),
            Token = jwtToken,
            UserName = user.UserName ?? string.Empty

          };
          return Ok ( response );
        }
      }
      ModelState.AddModelError ( "", "email or password incorrect" );
      return ValidationProblem ( ModelState );
    }


    [HttpPost ( "register" )]
    public async Task<IActionResult> Register ( [FromBody] RegisterRequestDto registerDto )
    {
      // Verifica se o e-mail ou nome de usuário já estão sendo usados
      var existingUser = await _userManager.FindByEmailAsync(registerDto.Email);
      if ( existingUser != null )
      {
        return BadRequest ( "E-mail já está em uso." );
      }

      var existingUsername = await _userManager.FindByNameAsync(registerDto.UserName);
      if ( existingUsername != null )
      {
        return BadRequest ( "Nome de usuário já está em uso." );
      }

      // Cria o novo usuário
      var newUser = new IdentityUser
      {
        UserName = registerDto.UserName,
        Email = registerDto.Email
      };

      var result = await _userManager.CreateAsync(newUser, registerDto.Password);

      if ( !result.Succeeded )
      {
        return BadRequest ( result.Errors );
      }

      // Adiciona o papel Reader
      await _userManager.AddToRoleAsync ( newUser, "Reader" );

      // Cria o perfil do usuário automaticamente
      var userProfile = new UserProfile
      {
        Id = Guid.NewGuid(),
        UserId = newUser.Id,
        FullName = registerDto.FullName,
        Bio = registerDto.Bio,
        UserName = registerDto.UserName

      };
      try
      {
        await _userRepository.CreateUserProfileAsync ( userProfile );

      }
      catch ( Exception e )
      {
        await _userManager.DeleteAsync ( newUser );
        return StatusCode ( 500, "Erro ao criar o perfil de usuário: " + e.Message );
      }

      return Ok ( new
      {
        message = "Usuário registrado com sucesso e perfil criado.",
        username = newUser.UserName,
        email = newUser.Email
      } );
    }

  }

}
