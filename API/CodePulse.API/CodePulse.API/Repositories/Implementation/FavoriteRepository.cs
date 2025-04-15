using CodePulse.API.Helper;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Interface;
using Microsoft.EntityFrameworkCore;

namespace CodePulse.API.Repositories.Implementation
{
  public class FavoriteRepository : IFavoriteRepository
  {
    private readonly ApplicationContext _applicationContext;

    public FavoriteRepository(ApplicationContext applicationContext)
    {
      _applicationContext = applicationContext;
    }


    public async Task<FavoritePostDto?> AddToFavoritesAsync ( string userId, Guid postId )
    {
      var alreadyExists = await _applicationContext.FavoritePosts
        .AnyAsync(x => x.UserId == userId && x.BlogPostId == postId);
      if ( alreadyExists ) return null;
      var favorite = new FavoritePost
      {
        Id = Guid.NewGuid(),
        UserId = userId,
        BlogPostId = postId,
        FavoritedAt = DateTime.UtcNow
      };

      await _applicationContext.FavoritePosts.AddAsync ( favorite );
      await _applicationContext.SaveChangesAsync ( );

      var loaded = await _applicationContext.FavoritePosts
        .Include(x => x.BlogPost)
        .ThenInclude(x => x.AuthorProfile)
        .FirstOrDefaultAsync(x => x.Id == favorite.Id);

      return loaded != null ? FavoritePostMapper.ToDto ( loaded ) : null;

    }

    public async Task<IEnumerable<FavoritePostDto>> GetFavoriteByUserAsync ( string userId )
    {
      var favorites = await _applicationContext.FavoritePosts
        .Where(x => x.UserId == userId )
        .Include(x => x.BlogPost)
        .ThenInclude(x => x.AuthorProfile)
          .ToListAsync ( );

      return favorites.Select( FavoritePostMapper.ToDto );
    }



    public async Task<bool> IsPostFavoritedByUserAsync ( string userId, Guid postId )
    {
      return await _applicationContext.FavoritePosts
        .AnyAsync ( x => x.UserId == userId && x.BlogPostId == postId );
    }

    public async Task<bool> RemoveFromFavoritesAsync ( string userId, Guid postId )
    {
      var favorite= await _applicationContext.FavoritePosts
        .FirstOrDefaultAsync ( x => x.UserId == userId && x.BlogPostId == postId );

      if ( favorite == null ) return false ;
      _applicationContext.FavoritePosts.Remove ( favorite );
      var result = _applicationContext.SaveChangesAsync ( );
      return true;
    }

   
  }
}
