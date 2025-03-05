using AutoMapper;
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
    private readonly IMapper _mapper;

    public CategoriesController(ICategoryRepository categoryRepository, IMapper mapper)
    {
      _categoryRepository = categoryRepository;
      _mapper = mapper;
    }

    [HttpPost]
    public async Task<IActionResult> createCategory(CreateCategoriesDto request)
    {
      //map dto to domain


      var categories = _mapper.Map<Category>(request);
      categories = await _categoryRepository.CreateAsync(categories);
      return Ok(_mapper.Map<CategoryDto>(categories));


     
    }

    [HttpGet]
    public async Task<IActionResult> GetCategories()
    {
      var categories = await _categoryRepository.GetAllCategories();
      return Ok(_mapper.Map<IEnumerable<CategoryDto>>(categories));

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

      
      return Ok(_mapper.Map<CategoryDto>(categoryId));

    }

    [HttpPut]
    [Route("{id:guid}")]
    public async Task<IActionResult> EditCategory([FromRoute] Guid id, UpdateCategoryRequestDto requestDto)
    {

      var category = _mapper.Map<Category>(requestDto);
      category.Id = id;
      category = await _categoryRepository.UpdateCategoryAsync(category);

      if(category == null)
      {
        return NotFound();
      }
      return Ok(_mapper.Map<CategoryDto>(category));


    }

    [HttpDelete]
    [Route("{id:guid}")]
    public async Task<IActionResult> DeleteCategory([FromRoute] Guid id)
    {
      var category = await _categoryRepository.DeleteCategoryAsync(id);
      if(category == null)
      {
        return NotFound();
      }
      //map to dto
      return Ok(_mapper.Map<CategoryDto>(category));
    }
  }
}
