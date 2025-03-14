using AutoMapper;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Implementation;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CodePulse.API.Controllers
  {
  [Route ( "api/[controller]" )]
  [ApiController]
  public class ImagesController : ControllerBase
    {
    private readonly IImageRepository _imageRepository;
    private readonly IMapper _mapper;

    public ImagesController (IImageRepository imageRepository, IMapper mapper ) {
      _imageRepository = imageRepository;
      _mapper = mapper;
      }

      [HttpPost]
    public async Task<ActionResult<BlogImageDto>> UploadImages ( IFormFile file) {
        try{
        var savedImage = await _imageRepository.SaveImageAsync(file);
        var imageDto = _mapper.Map<BlogImageDto>(savedImage);
        imageDto.Url = $"{Request.Scheme}://{Request.Host}/{savedImage.Url}";
        return Ok ( imageDto );
        }
        catch (ArgumentException e){
        return BadRequest ( e.Message );

        }
        catch(Exception e){
        return StatusCode ( 500, $"internal error no salvamento{e.Message}" );
        }

      }
    }
  }
