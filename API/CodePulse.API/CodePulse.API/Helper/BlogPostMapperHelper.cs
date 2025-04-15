using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Interface;

namespace CodePulse.API.Helper;
public static class BlogPostMapperHelper
{
  public static BlogPostDto MapToDto(BlogPost post)
{
  return new BlogPostDto
  {
    Id = post.Id,
    Title = post.Title,
    ShortDescription = post.ShortDescription,
    Content = post.Content,
    FeaturedImageUrl = post.FeaturedImageUrl,
    UrlHandle = post.UrlHandle,
    PublishedDate = post.PublishedDate,
    IsVisible = post.IsVisible,
    ViewCount = post.ViewCount,

    Categories = post.Categories.Select(c => new CategoryDto
    {
      Id = c.Id,
      Name = c.Name,
      UrlHandle = c.UrlHandle
    }).ToList(),

    Author = post.AuthorProfile == null ? null : new BlogPostAuthorDto
    {
      Id = post.AuthorProfile.Id,
      UserName = post.AuthorProfile.UserName,
      FullName = post.AuthorProfile.FullName,
      ImageUrl = post.AuthorProfile.Image != null
        ? $"https://localhost:7167/{post.AuthorProfile.Image.Url}"
        : null,


      Bio = post.AuthorProfile.Bio
    }
  };
}

  public static async Task<BlogPost> MapToDomainAsync(CreateBlogPostRequestDto dto, string userId, ICategoryRepository categoryRepository)
  {
    var blogPost = new BlogPost
    {
      Id = Guid.NewGuid(),
      Title = dto.Title,
      ShortDescription = dto.ShortDescription,
      Content = dto.Content,
      FeaturedImageUrl = dto.FeaturedImageUrl,
      UrlHandle = dto.UrlHandle,
      PublishedDate = dto.PublishedDate,
      IsVisible = dto.IsVisible,
      ViewCount = 0,
      AuthorId = userId,
      Categories = new List<Category>()
    };

    if (dto.Categories != null && dto.Categories.Any())
    {
      foreach (var categoryId in dto.Categories)
      {
        var category = await categoryRepository.GetCategoryByIdAsync(categoryId);
        if (category != null)
        {
          blogPost.Categories.Add(category);
        }
      }
    }

    return blogPost;
  }
}
