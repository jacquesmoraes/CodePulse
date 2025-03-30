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



    public async Task<IEnumerable<Category>> GetAllCategories(string? query = null
      , string? sortBy = null, string? sortDirection = null, int? pageNumber = 1, int? pageSize = 100 )
    {
      //query
      var categories = _dbContext.Categories.AsQueryable();

      // filter
       if(string.IsNullOrWhiteSpace(query) == false )
      {
        categories = categories.Where(x => x.Name.Contains(query));

      }

      //sort
      if(string.IsNullOrEmpty(sortBy)== false )
      {
        if(string.Equals(sortBy, "Name", StringComparison.OrdinalIgnoreCase ) )
        {
           var isAsc =  string.Equals(sortDirection, "asc", StringComparison.OrdinalIgnoreCase) ;
          categories = isAsc ? categories.OrderBy(x => x.Name) :
            categories.OrderByDescending(x => x.Name);
        }
      }

      //pagination
      //pagenumber 1 pagesize 5 - skip 0, take 5
      //pagenumber 2 pagesize 5 - skip 5, take 5
      //pagenumber 3 pagesize 5 - skip 10, take 5
      var skipResults = (pageNumber - 1) * pageSize;
      categories = categories.Skip(skipResults ?? 0).Take(pageSize ?? 100);





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

    public async Task<int> GetCategoriesCountAsync ( )
    {
      return await _dbContext.Categories.CountAsync();
       
    }
  }
}
