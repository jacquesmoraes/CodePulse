using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace CodePulse.API.Controllers
{
  [Route ( "api/[controller]" )]
  [ApiController]
  public class AuthController : ControllerBase
  {
    private readonly UserManager<IdentityUser> _userManager;
    private readonly ITokenRepository _tokenRepository;

    public AuthController ( UserManager<IdentityUser> userManager, ITokenRepository tokenRepository )
    {
      _userManager = userManager;
      _tokenRepository = tokenRepository;
    }


    [HttpPost]
    [Route("login")]
    public async Task<IActionResult> login ( [FromBody] LoginRequestDto request )
    {
      //check email
      var user = await _userManager.FindByEmailAsync(request.Email);
      if(user is not null )
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
            Token = jwtToken

          };
          return Ok(response);
        }
      }
      ModelState.AddModelError("","email or password incorrect");
      return ValidationProblem(ModelState);
    }


    [HttpPost]
    [Route ( "register" )]
    public async Task<IActionResult> Register ( [FromBody] RegisterRequestDto register )
    {
      var user = new IdentityUser
      {
        UserName = register.Email.Trim(),
        Email = register.Email.Trim(),
      };

      var identityUser = await _userManager.CreateAsync(user, register.Password);

      if ( identityUser.Succeeded )
      {
        var IdentityResult = await _userManager.AddToRoleAsync(user, "Reader");

        if ( IdentityResult.Succeeded )
        {
          return Ok ( );
        }
        else
        {
          if ( identityUser.Errors.Any ( ) )
          {
            AddMOdelErrors ( identityUser.Errors );
          }
        }
      }
      else
      {
        if ( identityUser.Errors.Any ( ) )
        {
          AddMOdelErrors ( identityUser.Errors );
        }
      }

      return ValidationProblem(ModelState);

    }

    private void AddMOdelErrors ( IEnumerable<IdentityError> errors )
    {
      foreach ( var error in errors )
      {
        ModelState.AddModelError ( "", error.Description );
      }
    }
  }

}
