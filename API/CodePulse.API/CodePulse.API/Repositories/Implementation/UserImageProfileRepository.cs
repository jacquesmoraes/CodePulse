using CodePulse.API.Data;
using CodePulse.API.Models.Domain;
using CodePulse.API.Repositories.Interface;
using Microsoft.EntityFrameworkCore;

namespace CodePulse.API.Repositories.Implementation
{
  public class UserImageProfileRepository : IUserImageProfileRepository
  {
    private readonly IWebHostEnvironment _environment;
    private readonly AuthContext _authContext;

    public UserImageProfileRepository ( IWebHostEnvironment environment, AuthContext authContext )
    {
      _environment = environment;
      _authContext = authContext;
    }

    public async Task<UserImageProfile> SaveUserImageAsync ( IFormFile file )
    {
      if ( !( file == null || file.Length == 0 ) )
      {
        var extension = Path.GetExtension(file.FileName).ToLower();
        var permited = new [] {".jpg", ".jpeg", ".png"};
        if ( !permited.Contains ( extension ) )
        {
          throw new ArgumentException ( "invalid image format" );
        }
        if ( file.Length > 10485760 )
        {
          throw new ArgumentException ( "the max size of image is 10mb" );
        }
        var sanitizedFileName = Path.GetFileNameWithoutExtension(file.FileName).Replace(" ", "_");
        var fileName = $"{sanitizedFileName}{ extension}";
        var relPath = Path.Combine("images/UserImages", fileName);
        var completePath = Path.Combine(_environment.WebRootPath, relPath);
        var directoryExists = Path.GetDirectoryName(completePath);
        if ( !Directory.Exists ( directoryExists ) )
        {
          Directory.CreateDirectory ( directoryExists! );
        }
        using ( var stream = new FileStream ( completePath, FileMode.Create ) )
        {
          await file.CopyToAsync ( stream );
        }
        var image = new UserImageProfile
        {
          Id = Guid.NewGuid(),
          FileName =sanitizedFileName,
          FileExtension = extension,
          Url = relPath.Replace("\\", "/")
        };
         _authContext.userImageProfiles.Add(image);
        await _authContext.SaveChangesAsync();
        return image;

      }
      throw new ArgumentException ( "select a valid file" );

    }
  }
}
