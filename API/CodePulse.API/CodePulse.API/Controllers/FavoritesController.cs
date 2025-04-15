using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace CodePulse.API.Controllers
{
  [Route ( "api/[controller]" )]
  [ApiController]
  [Authorize]
  public class FavoritesController : ControllerBase
  {

    private readonly IFavoriteRepository _favoriteRepository;
    public FavoritesController ( IFavoriteRepository favoriteRepository )
    {
      _favoriteRepository = favoriteRepository;
    }


    [HttpPost ( "{postId:guid}" )]
    public async Task<IActionResult> AddToFavorites ( Guid postId )
    {
      var userId = User.FindFirstValue( ClaimTypes.NameIdentifier);
      var result = await _favoriteRepository.AddToFavoritesAsync ( userId, postId );
      if ( result == null)
      {
        return BadRequest ( "post already in favorites" );
      }
      return Ok ( result );
    }



    [HttpGet]
    public async Task<IActionResult> GetMyFavorites ( )
    {
      var userId = User.FindFirstValue( ClaimTypes.NameIdentifier);
      var posts = await _favoriteRepository.GetFavoriteByUserAsync ( userId );
      return Ok ( posts );
    }


    [HttpGet ( "isFavorite/{postId:guid}" )]
    public async Task<IActionResult> IsPostFavoritedByUser ( Guid postId )
    {
      var userId = User.FindFirstValue( ClaimTypes.NameIdentifier);
      var isFavorite = await _favoriteRepository.IsPostFavoritedByUserAsync ( userId, postId );
      return Ok ( isFavorite );
    }


    [HttpDelete ( "{postId:guid}" )]
    public async Task<IActionResult> RemoveFromFavorites ( Guid postId )
    {
      var userId = User.FindFirstValue( ClaimTypes.NameIdentifier);
      var result = await _favoriteRepository.RemoveFromFavoritesAsync ( userId, postId );
     
      return result ? Ok ( "removed from favorites") : BadRequest ( "could not remove from favorites" );
    }


    

  }
}
