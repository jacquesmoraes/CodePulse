using AutoMapper;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Implementation;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace CodePulse.API.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  public class BlogPostController : ControllerBase
  {
    private readonly IBlogPostRepository _postRepository;
    private readonly IMapper _mapper;
    private readonly ICategoryRepository _categoryRepository;
    private readonly UserManager<IdentityUser> _userManager;
    private readonly IUserRepository _userRepository;

    public BlogPostController(IBlogPostRepository postRepository, 
        IMapper mapper,
        ICategoryRepository categoryRepository,
        UserManager<IdentityUser> userManager,
        IUserRepository userRepository)
    {
      _postRepository = postRepository;
      _mapper = mapper;
      _categoryRepository = categoryRepository;
      _userManager = userManager;
      _userRepository = userRepository;
    }

    [HttpPost]
    [Authorize(Roles = "Writer,Admin")]
    public async Task<IActionResult> CreateBlogPost([FromBody] CreateBlogPostRequestDto createBlogPost)
    {
        if (createBlogPost == null)
        {
            return BadRequest("The payload is empty.");
        }

        var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
        var userProfile = await _userRepository.GetUserProfileByIdentityUserIdAsync(userId);

        if (userProfile == null)
        {
            return NotFound("User profile not found.");
        }

        var blogPost = _mapper.Map<BlogPost>(createBlogPost);
        blogPost.Author = userProfile.UserName;

        if (createBlogPost.Categories?.Any() == true)
        {
            blogPost.Categories = new List<Category>();
            foreach (var categoryGuid in createBlogPost.Categories)
            {
                var existingCategory = await _categoryRepository.GetCategoryByIdAsync(categoryGuid);
                if (existingCategory != null)
                {
                    blogPost.Categories.Add(existingCategory);
                }
            }
        }

        blogPost = await _postRepository.CreateBlogPostAsync(blogPost);
        return Ok(_mapper.Map<BlogPostDto>(blogPost));
    }

    [HttpGet]
    public async Task<IActionResult> GetAllBlogPosts(
        [FromQuery] string? query,
        [FromQuery] string? sortBy,
        [FromQuery] string? sortDirection,
        [FromQuery] int? pageNumber,
        [FromQuery] int? pageSize)
    {
        var blogPosts = await _postRepository.GetAllAsync(query, sortBy, sortDirection, pageNumber, pageSize);
        return Ok(_mapper.Map<IEnumerable<BlogPostDto>>(blogPosts));
    }

    [HttpGet]
    [Route("{id:guid}")]
    public async Task<IActionResult> GetBlogPostById([FromRoute] Guid id)
    {
        var blogPostId = await _postRepository.GetBlogPostByIdAsync(id);
        if (blogPostId == null)
        {
            return NotFound();
        }
        return Ok(_mapper.Map<BlogPostDto>(blogPostId));
    }

    [HttpGet]
    [Route("{urlHandle}")]
    public async Task<IActionResult> GetPostByUrlHandle([FromRoute] string urlHandle)
    {
        var blogpost = await _postRepository.GetBlogPostByUrlHandle(urlHandle);
        return Ok(_mapper.Map<BlogPostDto>(blogpost));
    }

    [HttpPut]
    [Route("{id:guid}")]
    [Authorize(Roles = "Writer,Admin")]
    public async Task<IActionResult> UpdateBlogPost([FromRoute] Guid id, [FromBody] UpdateBlogPostRequestDto dto)
    {
        var existingPost = await _postRepository.GetBlogPostByIdAsync(id);
        if (existingPost == null)
            return NotFound();

        var user = await _userManager.GetUserAsync(User);
        if (user == null)
            return Unauthorized();

        var userProfile = await _userRepository.GetUserProfileByIdentityUserIdAsync(user.Id);
        if (userProfile == null)
            return Unauthorized();

        if (!User.IsInRole("Admin") && existingPost.Author != userProfile.UserName)
            return Forbid("You can only edit your own posts");

        var blogPost = _mapper.Map<BlogPost>(dto);
        blogPost.Id = existingPost.Id;
        blogPost.Author = existingPost.Author;

        var updatedPost = await _postRepository.UpdateBlogPostAsync(blogPost);
        return Ok(_mapper.Map<BlogPostDto>(updatedPost));
    }

    [HttpDelete("{id:guid}")]
    [Authorize(Roles = "Writer,Admin")]
    public async Task<IActionResult> DeleteBlogPost([FromRoute] Guid id)
    {
        var existingPost = await _postRepository.GetBlogPostByIdAsync(id);
        if (existingPost == null)
            return NotFound();

        var user = await _userManager.GetUserAsync(User);
        if (user == null)
            return Unauthorized();

        var userProfile = await _userRepository.GetUserProfileByIdentityUserIdAsync(user.Id);
        if (userProfile == null)
            return Unauthorized();

        if (!User.IsInRole("Admin") && existingPost.Author != userProfile.UserName)
            return Forbid("You can only delete your own posts");

        var deletePost = await _postRepository.DeleteBlogPostAsync(id);
        return Ok(_mapper.Map<BlogPostDto>(deletePost));
    }

    [HttpGet]
    [Route("count")]
    public async Task<IActionResult> GetBlogPostsCount()
    {
        var result = await _postRepository.GetBlogPostsCountAsync();
        return Ok(result);
    }

    [HttpGet]
    [Route("mostPopular")]
    public async Task<IActionResult> MostViewCount(int count = 5)
    {
        var posts = await _postRepository.GetPopularPosts(count);
        return Ok(posts);
    }
  }
}

