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
      try
      {
        await _dbContext.Categories.AddAsync(category);
        await _dbContext.SaveChangesAsync();
        return category;
      }
      catch (DbUpdateException ex)
      {
        Console.WriteLine($"Erro ao salvar no banco: {ex.InnerException?.Message ?? ex.Message}");
        throw;
      }
      catch (Exception ex)
      {
        Console.WriteLine($"Erro inesperado: {ex.Message}");
        throw;
      }
    }

    public async Task<IEnumerable<Category>> GetAllCategories()
    {
      return await _dbContext.Categories.ToListAsync();
    }

    public async Task<Category?> GetCategoryByIdAsync(Guid id)
    {
      return await _dbContext.Categories.FirstOrDefaultAsync(x => x.Id == id);
    }

    public async Task<Category?> UpdateCategoryAsync(Category category)
    {
      var existingCategory = await _dbContext.Categories.FirstOrDefaultAsync(x => x.Id == category.Id);

      if(existingCategory != null)
      {
        _dbContext.Entry(existingCategory).CurrentValues.SetValues(category);
        await _dbContext.SaveChangesAsync();
        return category;
      }

      return null;



    }
  }
}
