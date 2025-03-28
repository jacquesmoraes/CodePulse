using CodePulse.API.Data;
using CodePulse.API.Models.Domain;
using CodePulse.API.Repositories.Interface;
using Microsoft.EntityFrameworkCore;

namespace CodePulse.API.Repositories.Implementation
{
  public class CategoryRepository : ICategoryRepository
  {
    private readonly ApplicationContext _dbContext;
    public CategoryRepository(ApplicationContext dbContext)
    {
      _dbContext = dbContext;
    }
    public async Task<Category> CreateAsync(Category category)
    {
     
        await _dbContext.Categories.AddAsync(category);
        await _dbContext.SaveChangesAsync();
        return category;
      
    }


    public async Task<IEnumerable<Category>> GetAllCategories( string? query = null )
    {
      //query
      var categories = _dbContext.Categories.AsQueryable();

      // filter
       if(string.IsNullOrWhiteSpace(query) == false )
      {
        categories = categories.Where(x => x.Name.Contains(query));

      }

      //sort


      //pagination

      return await categories.ToListAsync();
    }

    public async Task<Category?> GetCategoryByIdAsync(Guid id)
    {
      return await _dbContext.Categories.FindAsync(id);
    }

    public async Task<Category?> UpdateCategoryAsync(Category category)
    {
      var existingCategory = await _dbContext.Categories.FindAsync(category.Id);

      if(existingCategory != null)
      {
        _dbContext.Entry(existingCategory).CurrentValues.SetValues(category);
        await _dbContext.SaveChangesAsync();
        return category;
      }

      return null;

    }



    public async Task<Category?> DeleteCategoryAsync(Guid id)
    {
      var category = await _dbContext.Categories.FindAsync(id);
      if (category == null)
      {
        return null;
      }
       _dbContext.Categories.Remove(category);
       await _dbContext.SaveChangesAsync();
      return category;

    }
  }
}
