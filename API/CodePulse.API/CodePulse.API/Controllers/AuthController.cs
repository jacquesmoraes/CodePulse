using AutoMapper;
using CodePulse.API.Exceptions;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Interface;
using CodePulse.API.Repositories.Interface.Service;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace CodePulse.API.Controllers
{
  [Route ( "api/[controller]" )]
  [ApiController]
  public class AuthController : ControllerBase
  {
    private readonly UserManager<UserProfile> _userManager;
    private readonly ITokenRepository _tokenRepository;
    private readonly IMapper _mapper;
    private readonly ILogger<AuthController> _logger;
    private readonly IAuthRepository _authRepository;

    public AuthController (
        UserManager<UserProfile> userManager,
        ITokenRepository tokenRepository,
        IMapper mapper,
        ILogger<AuthController> logger,
        IAuthRepository authRepository)
    {
      _userManager = userManager;
      _tokenRepository = tokenRepository;
      _mapper = mapper;
      _logger = logger;
      _authRepository = authRepository;
    }

    [HttpPost]
    [Route ( "login" )]
    public async Task<IActionResult> login ( [FromBody] LoginRequestDto request )
    {
      _logger.LogInformation ( "Login attempt for email: {Email}", request.Email );

      if ( string.IsNullOrEmpty ( request.Email ) || string.IsNullOrEmpty ( request.Password ) )
      {
        _logger.LogWarning ( "Login failed: Email or password is empty" );
        ModelState.AddModelError ( "", "Email and password are required" );
        return ValidationProblem ( ModelState );
      }

      //check email
      var user = await _userManager.FindByEmailAsync(request.Email);
      if ( user is not null )
      {
        _logger.LogInformation ( "User found with email: {Email}", request.Email );

        //check password
        var password = await _userManager.CheckPasswordAsync(user, request.Password);
        if ( password )
        {
          _logger.LogInformation ( "Password correct for user: {Email}", request.Email );

          //create token and response
          var roles = await _userManager.GetRolesAsync(user);
          _logger.LogInformation ( "User roles: {Roles}", string.Join ( ", ", roles ) );

          var jwtToken = _tokenRepository.CreateJwtToken(user, roles.ToList());
          var response = new LoginResponseDto
          {
            Email = request.Email,
            Roles = roles.ToList(),
            Token = jwtToken,
            UserName = user.UserName ?? string.Empty,
            FullName = user.FullName
          };
          return Ok ( response );
        }
        else
        {
          _logger.LogWarning ( "Password incorrect for user: {Email}", request.Email );
        }
      }
      else
      {
        _logger.LogWarning ( "User not found with email: {Email}", request.Email );
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

      // Cria o novo usuário com perfil integrado
      var userProfile = new UserProfile
      {
        UserName = registerDto.UserName.Replace(" ", "" ),
        Email = registerDto.Email,
        FullName = registerDto.FullName,
        Bio = registerDto.Bio
      };

      var result = await _userManager.CreateAsync(userProfile, registerDto.Password);

      if ( !result.Succeeded )
      {
        return BadRequest ( result.Errors );
      }

      // Sempre atribuir o papel de User para usuários que se registram
      await _userManager.AddToRoleAsync ( userProfile, "User" );

      // Retorna o DTO de resposta com todos os campos relevantes
      var response = _mapper.Map<RegisterResponseDto>(userProfile);

      return Ok ( response );
    }



    [HttpPost ( "forgot-password" )]
    public async Task<IActionResult> ForgotPassword ( [FromBody] ForgotPasswordRequestDto request )
    {
      if ( !ModelState.IsValid )
        return BadRequest ( new { message = "Dados inválidos", errors = ModelState.Values.SelectMany ( x => x.Errors ) } );

      var result = await _authRepository.ForgotPasswordAsync(request);

      // Sempre retorna OK para não revelar se o email existe
      return Ok ( new { message = "Se o email existir em nossa base, você receberá as instruções para redefinição de senha." } );
    }

    


    [HttpPost ( "reset-password" )]
    public async Task<IActionResult> ResetPassword ( [FromBody] ResetPasswordRequestDto request )
    {
      if ( !ModelState.IsValid )
        return BadRequest ( new { message = "invalid data", errors = ModelState.Values.SelectMany ( x => x.Errors ) } );

      try
      {
        await _authRepository.ResetPasswordAsync ( request );
        return Ok ( new { message = "password updated" } );
      }
      catch ( BusinessException ex )
      {
        return BadRequest ( new { message = ex.Message } );
      }
    }


  }
  }
