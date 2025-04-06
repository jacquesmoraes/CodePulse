using AutoMapper;
using CodePulse.API.Migrations;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Implementation;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CodePulse.API.Controllers
{
  [Route ( "api/[controller]" )]
  [ApiController]
  public class UserImageProfileController : ControllerBase
  {
    private readonly IUserImageProfileRepository _imageProfileRepository;
    private readonly IMapper _mapper;

    public UserImageProfileController ( IUserImageProfileRepository imageProfileRepository,
      IMapper mapper )
    {
      _imageProfileRepository = imageProfileRepository;
      _mapper = mapper;
    }

    [HttpPost ( "upload-image" )]
    [Authorize ( Roles = "Writer" )]
    public async Task<ActionResult<UserImageProfileDto>> UploadImage ( IFormFile file )
    {
      try
      {
        var saveImage = await _imageProfileRepository.SaveUserImageAsync(file);
        var imageDto =  _mapper.Map<UserImageProfileDto>(saveImage);
        imageDto.Url = $"{Request.Scheme}://{Request.Host}/{saveImage.Url}";
        return Ok ( imageDto );
      }
      catch ( ArgumentException e )
      {
        return BadRequest ( e.Message );

      }
      catch ( Exception e )
      {
        return StatusCode ( 500, $"internal error no salvamento{e.Message}" );
      }
    }
  }
}
