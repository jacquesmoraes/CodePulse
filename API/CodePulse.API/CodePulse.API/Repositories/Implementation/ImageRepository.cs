using CodePulse.API.Data;
using CodePulse.API.Models.Domain;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Mvc;

namespace CodePulse.API.Repositories.Implementation
  {
  public class ImageRepository : IImageRepository
    {
    private readonly IWebHostEnvironment _environment;
    private readonly ApplicationContext _context;
    

    public ImageRepository ( IWebHostEnvironment environment,ApplicationContext context ) {
      _environment = environment;
      _context = context;
      }
    public async Task<BlogImage> SaveImageAsync ( IFormFile file, string name ) {
      if ( !( file == null || file.Length == 0 ) ) {
        var extension = Path.GetExtension(file.FileName).ToLower();
        var permited = new [] {".jpg", ".jpeg", ".png"};

        if ( !permited.Contains ( extension ) ) {
          throw new ArgumentException ( "invalid image format" );
          }

          if ( file.Length > 10485760 ) {
          throw new ArgumentException ( "the max size of image is 10mb" );
          }
        var sanitizedFileName = Path.GetFileNameWithoutExtension(name).Replace(" ", "_");
        var fileName = $"{sanitizedFileName}{extension}";
        var relPath = Path.Combine("images", fileName);
        var completePath = Path.Combine(_environment.WebRootPath, relPath);

        var directoryExists = Path.GetDirectoryName(completePath);

        if ( !Directory.Exists ( directoryExists ) ) {
          Directory.CreateDirectory ( directoryExists! );
          }

          using ( var stream = new FileStream ( completePath, FileMode.Create ) ) {
          await file.CopyToAsync ( stream );
          }

        var image = new BlogImage{
          Id  = Guid.NewGuid(),
          FileName = sanitizedFileName,
          FileExtension = extension,
          Title = sanitizedFileName,
          Url = relPath.Replace("\\", "/"),
          DateCreated = DateTime.UtcNow
          };
         _context.BlogImages.Add ( image );
        await _context.SaveChangesAsync ( );
        return image;
        }
      throw new ArgumentException ( "select a valid file" );
      }
    }
  }


