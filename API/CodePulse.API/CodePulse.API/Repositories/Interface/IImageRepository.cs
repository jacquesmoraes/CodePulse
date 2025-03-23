using CodePulse.API.Models.Domain;

namespace CodePulse.API.Repositories.Interface
  {
  public interface IImageRepository
    {
    Task<BlogImage> SaveImageAsync ( IFormFile file, string fileName );
    }
  }
