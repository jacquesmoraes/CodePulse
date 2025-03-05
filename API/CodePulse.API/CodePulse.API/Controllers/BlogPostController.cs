using AutoMapper;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Interface;

using Microsoft.AspNetCore.Mvc;

namespace CodePulse.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BlogPostController : ControllerBase
    {
    private readonly IBlogPostRepository _postRepository;
    private readonly IMapper _mapper;

    public BlogPostController(IBlogPostRepository postRepository, IMapper mapper) {
      _postRepository = postRepository;
      _mapper = mapper;
    }

    [HttpPost]
      public async Task<IActionResult> CreateBlogPost([FromBody] CreateBlogPostRequestDto createBlogPost) {

      var blogPost = _mapper.Map<BlogPost>(createBlogPost);
      blogPost = await _postRepository.CreateBlogPostAsync(blogPost);
      return Ok(_mapper.Map<BlogPostDto>(blogPost));
     

    }

    [HttpGet]
      public async Task<IActionResult> GetAllBlogPosts() {

      var blogPosts = await _postRepository.GetAllAsync();
      return Ok(_mapper.Map<IEnumerable<BlogPostDto>>(blogPosts));
    }
    }
}
