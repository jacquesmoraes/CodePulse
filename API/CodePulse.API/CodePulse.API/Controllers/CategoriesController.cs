using CodePulse.API.Data;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Implementation;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CodePulse.API.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  public class CategoriesController : ControllerBase
  {
    private readonly ICategoryRepository _categoryRepository;

    public CategoriesController(ICategoryRepository categoryRepository)
    {
      _categoryRepository = categoryRepository;
    }

    [HttpPost]
    public async Task<IActionResult> createCategory(CreateCategoriesDto request)
    {
      //map dto to domain
      var categories = new Category
      {
        Name = request.Name,
        UrlHandle = request.UrlHandle,
      };
      await _categoryRepository.CreateAsync(categories);

      //domain model to dto
      var response = new CategoryDto
      {
        Id = categories.Id,
        Name = categories.Name,
        UrlHandle = categories.UrlHandle,
      };


      return Ok(response);
    }

    [HttpGet]
    public async Task<IActionResult> GetCategories()
    {
      var categories = await _categoryRepository.GetAllCategories();

      //map domain to DTO
      var response = new List<CategoryDto>();

      foreach (var category in categories)
      {
        response.Add(new CategoryDto
        {
          Id = category.Id,
          Name = category.Name,
          UrlHandle = category.UrlHandle
        });
      }
      return Ok(response);
    }

    [HttpGet]
    [Route("{id:Guid}")]
    public async Task<IActionResult> GetCategoryById([FromRoute] Guid id)
    {

      var categoryId = await _categoryRepository.GetCategoryByIdAsync(id);
      if (categoryId == null)
      {
        return NotFound();
      }

      var response = new CategoryDto
      {
        Id = categoryId.Id,
        Name = categoryId.Name,
        UrlHandle = categoryId.UrlHandle
      };

      return Ok(response);

    }

    [HttpPut]
    [Route("{id:guid}")]
    public async Task<IActionResult> EditCategory([FromRoute] Guid id, UpdateCategoryRequestDto requestDto)
    {

      var category = new Category
      {
        Id = id,
        Name = requestDto.Name,
        UrlHandle = requestDto.UrlHandle
      };
      category = await _categoryRepository.UpdateCategoryAsync(category);

      if (category == null)
      {
        return NotFound();
      }
      var response = new CategoryDto
      {
        Id = category.Id,
        Name = category.Name,
        UrlHandle = category.UrlHandle
      };
      return Ok(response);


    }
  }
}
