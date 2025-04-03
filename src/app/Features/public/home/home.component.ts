import { Component, OnInit } from '@angular/core';
import { BlogPostService } from '../../blog-post/services/blog-post.service';
import { BlogPost } from '../../blog-post/models/blog-post.model';
import { Category } from '../../Categories/models/category.model';
import { CategoryService } from '../../Categories/services/category.service';

import { ViewportScroller } from '@angular/common';
import { NgxSpinnerService } from 'ngx-spinner';
import { query } from '@angular/animations';
import { forkJoin } from 'rxjs';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  allPosts: BlogPost[] = [];
  filteredBlogposts: BlogPost[] = [];
  recentPosts: BlogPost[] = [];
  loading = true;
  blogsPerPage = 4;
  pageNumber = 1;
  totalPagesList: number[] = [];
  popularPosts: BlogPost[] = [];
  selectedCategoryIds: string[] = [];

  categories$ = this.categoryService.categories$;
  categoryList: Category[] = [];

  constructor(
    private blogpostservice: BlogPostService,
    private categoryService: CategoryService,
    private viewportScroller: ViewportScroller,
    private spinner: NgxSpinnerService
  ) { }

  ngOnInit(): void {
    this.viewportScroller.scrollToPosition([0, 0]);
    forkJoin({
      posts: this.blogpostservice.GetAllBlogPosts(),
      categories: this.categoryService.loadAllCategories() 
    }).subscribe(({ posts, categories }) => {
      const sorted = posts.sort((a, b) =>
        new Date(b.publishedDate).getTime() - new Date(a.publishedDate).getTime()
      );
      this.blogpostservice.getMostViewedPosts(10).subscribe(posts => {
        this.popularPosts= posts;
      })
      this.allPosts = sorted;
      this.recentPosts = sorted.slice(0, 5);
      this.categoryList = categories;
      this.selectedCategoryIds = [];

      this.pageNumber = 1;
      this.updatePagination();

      this.loading = false;
      this.spinner.hide();

    });

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
    this.spinner.show();
    setTimeout(() => {
      this.updatePagination();
      this.loading = false;
      this.spinner.hide();
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
    this.viewportScroller.scrollToPosition([0, 0]);
    this.loading = true;
    this.spinner.show();
  
    setTimeout(() => {
      this.selectedCategoryIds = [];
      this.pageNumber = 1;
      this.updatePagination();
      this.loading = false;
      this.spinner.hide();
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
    this.spinner.show();
  
    this.blogpostservice.GetAllBlogPosts(query).subscribe(posts => {
      const sorted = posts.sort((a, b) =>
        new Date(b.publishedDate).getTime() - new Date(a.publishedDate).getTime()
      );
      this.allPosts = sorted;
      this.pageNumber = 1;
      this.updatePagination();
  
      this.loading = false;
      this.spinner.hide();
    });
  }
  



}
