import { Component, OnInit } from '@angular/core';
import { BlogPostService } from '../../blog-post/services/blog-post.service';
import { Observable } from 'rxjs';
import { BlogPost } from '../../blog-post/models/blog-post.model';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit{
  
  blogs$?: Observable<BlogPost[]>
  recentPosts: BlogPost[] = [];

  constructor(private blogpostservice: BlogPostService){

  }
  
  
  ngOnInit(): void {
    this.blogs$ = this.blogpostservice.GetAllBlogPosts();
    this.blogs$.subscribe(blogs => {
      // Ordena os posts pela data e pega os 5 mais recentes
      const sorted = blogs.sort((a, b) =>
        new Date(b.publishedDate).getTime() - new Date(a.publishedDate).getTime()
      );
      this.recentPosts = sorted.slice(0, 5);
    });
  }
  
  getUniqueCategories(blogs: BlogPost[]): string[] {
    const categorySet = new Set<string>();
    blogs.forEach(blog => {
      blog.categories.forEach(category => {
        categorySet.add(category.name);
      });
    });
    return Array.from(categorySet).sort();
  }
  
}
