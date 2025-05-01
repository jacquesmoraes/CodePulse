import { Component, OnDestroy, OnInit } from '@angular/core';
import { BlogPostService } from '../../blog-post/services/blog-post.service';
import { BlogPost } from '../../blog-post/models/blog-post.model';
import { Category } from '../../Categories/models/category.model';
import { CategoryService } from '../../Categories/services/category.service';

import { ViewportScroller } from '@angular/common';
import { forkJoin } from 'rxjs';
import { UserProfile } from 'src/app/profile/user-profile/shared/models/user-profile.model';
import { UserProfileService } from 'src/app/profile/user-profile.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
 
  allPosts: BlogPost[] = [];
  filteredBlogposts: BlogPost[] = [];
  recentPosts: BlogPost[] = [];
  sidebarLoading= true;
  popularLoading = true;
  loading = true;
  blogsPerPage = 10;
  pageNumber = 1;
  totalPagesList: number[] = [];
  popularPosts: BlogPost[] = [];
  selectedCategoryIds: string[] = [];
  writers: UserProfile[] = [];
  readers: UserProfile[] = [];
  selectedWriterIds: string[] = [];
  categories$ = this.categoryService.categories$;
  categoryList: Category[] = [];

  

  constructor(
   
    private blogpostservice: BlogPostService,
    private categoryService: CategoryService,
    public userProfileService:UserProfileService,
    private viewportScroller: ViewportScroller,
  
    
  ){} 
  
  ngOnInit(): void {
    forkJoin({
      posts: this.blogpostservice.GetAllBlogPosts(),
      categories: this.categoryService.loadAllCategories(),
      writers: this.userProfileService.getAllWriters(),
      readers: this.userProfileService.getAllReaders() 
    }).subscribe({
      next: ({ posts, categories, writers,readers }) => {
    
        const sorted = posts.sort((a, b) =>
          new Date(b.publishedDate).getTime() - new Date(a.publishedDate).getTime()
        );
  
        this.allPosts = sorted;
        this.recentPosts = sorted.slice(0, 5);
        this.categoryList = categories;
        this.selectedCategoryIds = [];
        this.pageNumber = 1;
        this.writers = writers.filter(w => w.role === 'Writer');
        this.readers = readers.filter(r => r.role === 'User');
        this.selectedWriterIds = [];
        this.updatePagination();
        this.loading = false;
        this.sidebarLoading = false;
        
      },
      error: (error) => {
        console.error('Erro ao carregar dados:', error);
        this.loading = false;
        this.sidebarLoading = false;
      }
    });
  
    this.blogpostservice.getMostViewedPosts(10).subscribe({
      next: (posts) => {
        this.popularPosts = posts;
        this.popularLoading = false;
      },
      error: (error) => {
        console.error('Erro ao carregar posts populares:', error);
        this.popularLoading = false;
      }
    });
  }
  
  onWriterClick(writerId: string): void {
    const index = this.selectedWriterIds.indexOf(writerId);
    if (index > -1) {
      this.selectedWriterIds.splice(index, 1);
    } else {
      this.selectedWriterIds.push(writerId);
    }
  
    this.pageNumber = 1;
    this.loading = true;
   
    setTimeout(() => {
      this.updatePagination();
      this.loading = false;
      
      this.viewportScroller.scrollToPosition([0, 0]);
    }, 0);
  }

  removeWriter(writerId: string): void {
    const index = this.selectedWriterIds.indexOf(writerId);
    if (index > -1) {
      this.selectedWriterIds.splice(index, 1);
      this.updatePagination();
    }
  }

  clearWriterFilter(): void {
    this.selectedWriterIds = [];
    this.updatePagination();
  }





  updatePagination(): void {
    let filtered = [...this.allPosts];

    if (this.selectedCategoryIds.length > 0) {
      filtered = filtered.filter(post =>
        this.selectedCategoryIds.every(catId =>
          post.categories.some(c => c.id === catId)
        )
      );
    }
    if (this.selectedWriterIds.length > 0) {
      filtered = filtered.filter(post =>
        this.selectedWriterIds.includes(post.author.id)
      );
    }

    const totalPages = Math.ceil(filtered.length / this.blogsPerPage);
    this.totalPagesList = Array.from({ length: totalPages }, (_, i) => i + 1);

    const start = (this.pageNumber - 1) * this.blogsPerPage;
    const end = start + this.blogsPerPage;

    this.filteredBlogposts = filtered.slice(start, end);
  }

  onCategoryClick(categoryId: string): void {
    const index = this.selectedCategoryIds.indexOf(categoryId);
    if (index > -1) {
      this.selectedCategoryIds.splice(index, 1);
    } else {
      this.selectedCategoryIds.push(categoryId);
    }
  
    this.pageNumber = 1;
    this.loading = true;
    
    setTimeout(() => {
      this.updatePagination();
      this.loading = false;
    
      this.viewportScroller.scrollToPosition([0, 0]);
    }, 0);
  }
  

  getCategoryNameById(id: string): string {
    const category = this.categoryList.find(x => x.id === id);
    return category ? category.name : '';
  }

  removeCategory(id: string): void {

    this.selectedCategoryIds = this.selectedCategoryIds.filter(catId => catId !== id);
    this.pageNumber = 1;
    this.updatePagination();

  }

  clearCategoryFilter(): void {
   
    this.loading = true;
    
  
    setTimeout(() => {
      this.selectedCategoryIds = [];
      this.pageNumber = 1;
      this.updatePagination();
      this.loading = false;
    
    }, 0);
  }

  getPage(page: number): void {
    this.viewportScroller.scrollToPosition([0, 0]);
    this.pageNumber = page;
    this.updatePagination();
  }

  previousPage(): void {

    if (this.pageNumber > 1) {
      this.pageNumber--;
      this.updatePagination();

    }
  }

  nextPage(): void {

    if (this.pageNumber < this.totalPagesList.length) {
      this.pageNumber++;
      this.updatePagination();

    }
  }
   

  onSearch(query: string) {
    this.viewportScroller.scrollToPosition([0, 0]);
    this.loading = true;
    
  
    this.blogpostservice.GetAllBlogPosts(query).subscribe(posts => {
      const sorted = posts.sort((a, b) =>
        new Date(b.publishedDate).getTime() - new Date(a.publishedDate).getTime()
      );
      this.allPosts = sorted;
      this.pageNumber = 1;
      this.updatePagination();
  
      this.loading = false;
      
    });
  }
  
  trackByFn(index: number, item: any): number {
    return index;
  }

 
}
