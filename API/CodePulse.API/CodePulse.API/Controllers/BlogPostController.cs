using AutoMapper;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace CodePulse.API.Controllers
  {
  [Route ( "api/[controller]" )]
  [ApiController]
  public class BlogPostController : ControllerBase
    {
    private readonly IBlogPostRepository _postRepository;
    private readonly IMapper _mapper;
    private readonly ICategoryRepository _categoryRepository;

    public BlogPostController ( IBlogPostRepository postRepository, IMapper mapper,
    ICategoryRepository categoryRepository ) {
      _postRepository = postRepository;
      _mapper = mapper;
      _categoryRepository = categoryRepository;
      }

    [HttpPost]
    [Authorize(Roles = "Writer")]
    public async Task<IActionResult> CreateBlogPost ( [FromBody] CreateBlogPostRequestDto createBlogPost ) {

      if ( createBlogPost == null ) {
        return BadRequest ( "the payload is empty" );
        }

      var blogPost = _mapper.Map<BlogPost>(createBlogPost);


      if ( createBlogPost.Categories?.Any ( ) == true ) {

        blogPost.Categories = new List<Category> ( );
        foreach ( var categoryGuid in createBlogPost.Categories ) {
          var existingCategory = await _categoryRepository.GetCategoryByIdAsync(categoryGuid);

          if ( existingCategory is not null ) {
            blogPost.Categories.Add ( existingCategory );
            }
          }

        }


      blogPost = await _postRepository.CreateBlogPostAsync ( blogPost );
      return Ok ( _mapper.Map<BlogPostDto> ( blogPost ) );


      }

    [HttpGet]
    
    public async Task<IActionResult> GetAllBlogPosts ( ) {

      var blogPosts = await _postRepository.GetAllAsync();
      return Ok ( _mapper.Map<IEnumerable<BlogPostDto>> ( blogPosts ) );
      }


    [HttpGet]
    [Route ( "{id:guid}" )]
    public async Task<IActionResult> GetBlogPostById ( [FromRoute] Guid id ) {
      var blogPostId = await _postRepository.GetBlogPostByIdAsync(id);
      if ( blogPostId == null ) {
        return NotFound ( );
        }
      return Ok ( _mapper.Map<BlogPostDto> ( blogPostId ) );

      }

      [HttpGet]
      [Route("{urlHandle}")]
      public async Task<IActionResult> GetPostByUrlHandle([FromRoute] string urlHandle){
      var blogpost = await _postRepository.GetBlogPostByUrlHandle(urlHandle);
      return Ok ( _mapper.Map<BlogPostDto>(blogpost) );
      }

    [HttpPut]
    [Route ( "{id:guid}" )]
    [Authorize(Roles = "Writer")]
    public async Task<IActionResult> UpdateBlogPost ([FromRoute] Guid id, [FromBody] UpdateBlogPostRequestDto dto ) {
      if ( dto == null )
        return BadRequest ( );

      var existingPost = await _postRepository.GetBlogPostByIdAsync(id);
      if ( existingPost == null )
        return NotFound ( );

      var blogPost = _mapper.Map<BlogPost>(dto);
      blogPost.Id = existingPost.Id;

      var updatedPost = await _postRepository.UpdateBlogPostAsync(blogPost);
      return Ok ( _mapper.Map<BlogPostDto> ( updatedPost ) );
      }


      [HttpDelete ("{id:guid}")]
      [Authorize(Roles = "Writer")]
      public async Task<IActionResult> DeleteBlogPost([FromRoute] Guid id){
      var deletePost = await _postRepository.DeleteBlogPostAsync ( id );
      if ( deletePost == null ) return NotFound();
      return Ok (_mapper.Map<BlogPostDto>(deletePost ));
      }
    }
  }

