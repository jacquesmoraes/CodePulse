using CodePulse.API.Models.Dto;

namespace CodePulse.API.Repositories.Interface
{
  public interface IFavoriteRepository
  {
    Task<IEnumerable<FavoritePostDto>> GetFavoriteByUserAsync ( string userId );
    Task<FavoritePostDto?> AddToFavoritesAsync ( string userId, Guid postId );
    Task<bool> RemoveFromFavoritesAsync ( string userId, Guid postId );
    Task<bool> IsPostFavoritedByUserAsync ( string userId, Guid postId );

  }
}
