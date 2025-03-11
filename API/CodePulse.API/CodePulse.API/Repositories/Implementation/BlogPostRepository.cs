using AutoMapper;
using CodePulse.API.Data;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;
using CodePulse.API.Repositories.Interface;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.EntityFrameworkCore;

namespace CodePulse.API.Repositories.Implementation
  {
  public class BlogPostRepository : IBlogPostRepository
    {

    private readonly ApplicationContext _context;
    

    public BlogPostRepository ( ApplicationContext context ) {
      _context = context;
      
      }

    public async Task<BlogPost> CreateBlogPostAsync ( BlogPost blogPost ) {
      await _context.BlogPosts.AddAsync ( blogPost );
      await _context.SaveChangesAsync ( );
      return blogPost;
      }

    public async Task<IEnumerable<BlogPost>> GetAllAsync ( ) {
      return await _context.BlogPosts.Include ( x => x.Categories ).ToListAsync ( );

      }

    public async Task<BlogPost?> GetBlogPostByIdAsync ( Guid id ) {
      return await _context.BlogPosts.Include ( x => x.Categories )
      .FirstOrDefaultAsync ( bp => bp.Id == id );
      }

    public async Task<BlogPost?> UpdateBlogPostAsync ( BlogPost blogPost ) {
      var existingPost = await _context.BlogPosts
        .Include(bp => bp.Categories)
        .FirstOrDefaultAsync(bp => bp.Id == blogPost.Id);

      if ( existingPost == null )
        return null;

      _context.Entry ( existingPost ).CurrentValues.SetValues ( blogPost );

      var categoryIds = blogPost.Categories.Select(x => x.Id).ToList();
      var categories = await _context.Categories
        .Where(c => categoryIds.Contains(c.Id))
        .ToListAsync();

      existingPost.Categories.Clear ( );
      existingPost.Categories.AddRange ( categories );

      await _context.SaveChangesAsync ( );
      return existingPost;
      }

    public async Task<BlogPost?> DeleteBlogPostAsync ( Guid id ) {
      var blogPostToDelete = await _context.BlogPosts.FindAsync(id);
      if(blogPostToDelete != null){
         _context.BlogPosts.Remove ( blogPostToDelete );
        await _context.SaveChangesAsync ( );
        return blogPostToDelete;
      }
      return null;
      }
    }
    }
