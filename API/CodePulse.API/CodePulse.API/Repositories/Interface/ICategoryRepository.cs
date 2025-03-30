using CodePulse.API.Models.Domain;

namespace CodePulse.API.Repositories.Interface
{
  public interface ICategoryRepository
  {
    Task<Category> CreateAsync(Category category);
    Task<IEnumerable<Category>> GetAllCategories(string? query = null,
      string? sortBy= null,
      string? sortDirection = null,
      int? pageNumber = 1,
      int? pageSize = 100);

    Task<int> GetCategoriesCountAsync();
    Task<Category?> GetCategoryByIdAsync(Guid id);
    Task<Category?> UpdateCategoryAsync(Category category);
    Task<Category?> DeleteCategoryAsync(Guid id);


  }
}
