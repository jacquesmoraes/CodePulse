using CodePulse.API.Helper;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace CodePulse.API.Controllers
{
  [Route ( "api/[controller]" )]
  [ApiController]
  public class BlogPostController : ControllerBase
  {
    private readonly IBlogPostRepository _postRepository;
    private readonly ICategoryRepository _categoryRepository;
    private readonly UserManager<UserProfile> _userManager;
    private readonly ILogger<BlogPostController> _logger;

    public BlogPostController (
        IBlogPostRepository postRepository,
        ICategoryRepository categoryRepository,
        UserManager<UserProfile> userManager,
        ILogger<BlogPostController> logger )
    {
      _postRepository = postRepository;
      _categoryRepository = categoryRepository;
      _userManager = userManager;
      _logger = logger;
    }

    [HttpPost]
    [Authorize ( Roles = "Writer,Admin" )]
    public async Task<IActionResult> CreateBlogPost ( [FromBody] CreateBlogPostRequestDto createBlogPost )
    {
      if ( createBlogPost == null )
      {
        return BadRequest ( "The payload is empty." );
      }
      createBlogPost.UrlHandle = FormatUrlHandle(createBlogPost.UrlHandle);

      var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
      var user = await _userManager.FindByIdAsync(userId);
      if ( user == null )
      {
        return NotFound ( "User not found." );
      }

      var blogPost = await BlogPostMapperHelper.MapToDomainAsync(createBlogPost, user.Id, _categoryRepository);

      blogPost = await _postRepository.CreateBlogPostAsync ( blogPost );
      var response = BlogPostMapperHelper.MapToDto(blogPost);
      return Ok ( response );
    }



    [HttpGet]
    public async Task<IActionResult> GetAllBlogPosts (
        [FromQuery] string? query,
        [FromQuery] string? sortBy,
        [FromQuery] string? sortDirection,
        [FromQuery] int? pageNumber,
        [FromQuery] int? pageSize )
    {
      var blogPosts = await _postRepository.GetAllAsync(query, sortBy, sortDirection, pageNumber, pageSize);
       
      var mapped = blogPosts.Select(BlogPostMapperHelper.MapToDto).ToList();
      return Ok ( mapped );
    }



    [HttpGet]
    [Route ( "{id:guid}" )]
    public async Task<IActionResult> GetBlogPostById ( [FromRoute] Guid id )
    {
      var blogPost = await _postRepository.GetBlogPostByIdAsync(id);
      if ( blogPost == null )
      {
        return NotFound ( );
      }
      return Ok ( BlogPostMapperHelper.MapToDto ( blogPost ) );
    }




    [HttpGet("my-posts")]
    
    [Authorize(Roles = "Writer, Admin")]
    public async Task<IActionResult> GetAuthorPosts ( )
    {
      var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
      var isAdmin = User.IsInRole("Admin");

      var posts = isAdmin ? await _postRepository.GetAllAsync() :
        await _postRepository.GetPostByAuthorAsync(userId);

      var maped = posts.Select(BlogPostMapperHelper.MapToDto).ToList();
      return Ok(maped);

    }




    [HttpGet ( "{urlHandle}" )]
    public async Task<IActionResult> GetPostByUrlHandle ( string urlHandle )
    {
      var post = await _postRepository.GetBlogPostByUrlHandle(urlHandle);
      if ( post == null ) return NotFound ( );
      post.ViewCount++;
      await _postRepository.UpdateBlogPostAsync(post);
      var dto = BlogPostMapperHelper.MapToDto(post);
      return Ok ( dto );
    }


    [HttpPut]
    [Route ( "{id:guid}" )]
    [Authorize ( Roles = "Writer,Admin" )]
    public async Task<IActionResult> UpdateBlogPost ( [FromRoute] Guid id, [FromBody] UpdateBlogPostRequestDto updateBlogPost )
    {
      var existingBlogPost = await _postRepository.GetBlogPostByIdAsync(id);
      if ( existingBlogPost == null )
      {
        return NotFound ( );
      }

      var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
      if ( existingBlogPost.AuthorId != userId )
      {
        return Forbid ( );
      }
       updateBlogPost.UrlHandle = FormatUrlHandle(updateBlogPost.UrlHandle);
      // Mapeamento manual
      existingBlogPost.Title = updateBlogPost.Title;
      existingBlogPost.ShortDescription = updateBlogPost.ShortDescription;
      existingBlogPost.Content = updateBlogPost.Content;
      existingBlogPost.FeaturedImageUrl = updateBlogPost.FeaturedImageUrl;
      existingBlogPost.UrlHandle = updateBlogPost.UrlHandle;
      existingBlogPost.PublishedDate = updateBlogPost.PublishedDate;
      existingBlogPost.IsVisible = updateBlogPost.IsVisible;

      existingBlogPost.Categories = new List<Category> ( );
      if ( updateBlogPost.Categories?.Any ( ) == true )
      {
        foreach ( var categoryGuid in updateBlogPost.Categories )
        {
          var existingCategory = await _categoryRepository.GetCategoryByIdAsync(categoryGuid);
          if ( existingCategory != null )
          {
            existingBlogPost.Categories.Add ( existingCategory );
          }
        }
      }

      var updatedBlogPost = await _postRepository.UpdateBlogPostAsync(existingBlogPost);
      return Ok ( BlogPostMapperHelper.MapToDto ( updatedBlogPost ) );
    }

    [HttpDelete ( "{id:guid}" )]
    [Authorize ( Roles = "Writer,Admin" )]
    public async Task<IActionResult> DeleteBlogPost ( [FromRoute] Guid id )
    {
      var existingPost = await _postRepository.GetBlogPostByIdAsync(id);
      if ( existingPost == null )
        return NotFound ( );

      var user = await _userManager.GetUserAsync(User);
      if ( user == null )
        return Unauthorized ( );

      if ( !User.IsInRole ( "Admin" ) && existingPost.AuthorId != user.Id )
        return Forbid ( "You can only delete your own posts" );

      var deletePost = await _postRepository.DeleteBlogPostAsync(id);
      return Ok ( BlogPostMapperHelper.MapToDto ( deletePost ) );
    }

    [HttpGet]
    [Route ( "count" )]
    public async Task<IActionResult> GetBlogPostsCount ( )
    {
      var result = await _postRepository.GetBlogPostsCountAsync();
      return Ok ( result );
    }

    [HttpGet]
    [Route ( "mostPopular" )]
    public async Task<IActionResult> MostViewCount ( int count = 5 )
    {
      try
      {
        var posts = await _postRepository.GetPopularPosts(count);
        var mappedPosts = posts.Select(BlogPostMapperHelper.MapToDto).ToList();
        return Ok ( mappedPosts );
      }
      catch ( Exception ex )
      {
        _logger.LogError ( ex, "Error getting most popular posts" );
        return StatusCode ( 500, "An error occurred while getting the most popular posts" );
      }
    }


    [HttpGet("related/{postId:guid}")]
public async Task<IActionResult> GetRelatedPosts([FromRoute] Guid postId)
{
    var relatedPosts = await _postRepository.GetRelatedPostsAsync(postId);
    var mapped = relatedPosts.Select(BlogPostMapperHelper.MapToDto).ToList();
    return Ok(mapped);
}

    private string FormatUrlHandle(string urlHandle)
{
    if (string.IsNullOrEmpty(urlHandle))
        return string.Empty;

    return urlHandle
        .ToLowerInvariant()
        .Trim()
        .Replace(" ", "-")           // Substitui espaços por hífens
        .Replace("--", "-")          // Remove hífens duplicados
        .Replace("[^a-z0-9\\-]", "") // Remove caracteres especiais
        .Replace("-+", "-");         // Remove múltiplos hífens seguidos
}
  }



}
