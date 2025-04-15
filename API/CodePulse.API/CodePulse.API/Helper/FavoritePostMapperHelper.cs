using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;

namespace CodePulse.API.Helper
{
    public static class FavoritePostMapper
    {
        public static FavoritePostDto ToDto(FavoritePost favorite)
        {
            return new FavoritePostDto
            {
                Id = favorite.Id,
                UserId = favorite.UserId,
                BlogPostId = favorite.BlogPostId,
                BlogPostTitle = favorite.BlogPost?.Title ?? "",
                BlogPostUrlHandle = favorite.BlogPost?.UrlHandle ?? "",
                BlogPostImageUrl = favorite.BlogPost?.FeaturedImageUrl ?? "",
                AuthorUserName = favorite.BlogPost?.AuthorProfile?.UserName ?? "",
                FavoritedAt = favorite.FavoritedAt
            };
        }
    }
}
