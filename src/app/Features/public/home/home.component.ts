import { Component, OnInit } from '@angular/core';
import { BlogPostService } from '../../blog-post/services/blog-post.service';
import { BlogPost } from '../../blog-post/models/blog-post.model';
import { Observable } from 'rxjs';
import { Category } from '../../Categories/models/category.model';
import { CategoryService } from '../../Categories/services/category.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  blogs$?: Observable<BlogPost[]>;
  categories$!: Observable<Category[]>;
  recentPosts: BlogPost[] = [];

  allPosts: BlogPost[] = [];
  filteredBlogposts: BlogPost[] = [];

  selectedCategoryIds: string[] = []; 

  constructor(
    private blogpostservice: BlogPostService,
    private categoryService: CategoryService
  ) {}

  ngOnInit(): void {
  
    this.blogs$ = this.blogpostservice.GetAllBlogPosts();
    this.categories$ = this.categoryService.categories$;

    
    this.categoryService.loadAllCategories();

   
    this.blogs$.subscribe(blogs => {
      const sorted = blogs.sort((a, b) =>
        new Date(b.publishedDate).getTime() - new Date(a.publishedDate).getTime()
      );

      this.allPosts = sorted;
      this.filteredBlogposts = sorted; 
      this.recentPosts = sorted.slice(0, 5);
    });
  }

  onCategoryClick(categoryId: string): void {
    const index = this.selectedCategoryIds.indexOf(categoryId);

    if (index > -1) {
      
      this.selectedCategoryIds = this.selectedCategoryIds.filter(id => id !== categoryId);
    } else {
    
      this.selectedCategoryIds = [...this.selectedCategoryIds, categoryId];
    }
    

    this.applyCategoryFilter();
  }

  applyCategoryFilter(): void {
    if (this.selectedCategoryIds.length === 0) {
      this.filteredBlogposts = this.allPosts;
    } else {
      this.filteredBlogposts = this.allPosts.filter(blog =>
        this.selectedCategoryIds.every(selectedId =>
          blog.categories.some(cat => cat.id === selectedId)
        )
      );
    }
  }

  clearCategoryFilter(): void {
    this.selectedCategoryIds = [];
    this.filteredBlogposts = this.allPosts;
  }
}
