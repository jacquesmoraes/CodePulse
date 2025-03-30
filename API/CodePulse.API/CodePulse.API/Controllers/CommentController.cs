using AutoMapper;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace CodePulse.API.Controllers
{
  [Route ( "api/[controller]" )]
  [ApiController]
  public class CommentController : ControllerBase
  {
    private readonly UserManager<IdentityUser> _userManager;
    private readonly IMapper _mapper;
    private readonly ICommentRepository _commentRepository;

    public CommentController ( UserManager<IdentityUser> userManager, IMapper mapper, ICommentRepository commentRepository )
    {
      _userManager = userManager;
      _mapper = mapper;
      _commentRepository = commentRepository;
    }

    [HttpPost]
         [Authorize(Roles = "Reader,Writer")]
    public async Task<IActionResult> CreateComment ( [FromBody] AddCommentRequestDto commentRequest )
    {
      var userName = User?.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Name)?.Value;
      if ( string.IsNullOrEmpty ( userName ) )
      {
        return Unauthorized ( );
      }

      //map dto to entity
      var comment = _mapper.Map<BlogPostComment>(commentRequest);
      comment.CommentDate = DateTime.UtcNow;
      comment.UserName = userName ?? "";

      //save 
      await _commentRepository.addCommentAscync ( comment );

      //map entity to dto
      var response = _mapper.Map<CommentDto>(comment);

      return Ok ( response );



    }
   [HttpGet]
   [Route("{postId:guid}")]
    public async Task<IActionResult> GetCommentsByPost(Guid postId)
    {
        var comments = await _commentRepository.GetByPostId(postId);
        var commentsDto = _mapper.Map<List<CommentDto>>(comments);
        return Ok(commentsDto);
    }


  }

}
