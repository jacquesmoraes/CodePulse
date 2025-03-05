import { Component, OnInit } from '@angular/core';
import { blogPost } from '../models/blog-post.model';
import { BlogPostService } from '../services/blog-post.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-blogpost-list',
  templateUrl: './blogpost-list.component.html',
  styleUrls: ['./blogpost-list.component.css']
})
export class BlogpostListComponent implements OnInit {

  blogPosts$? : Observable<blogPost[]>
  
  constructor(private blogPostService: BlogPostService){

  }

  ngOnInit(): void {
    this.blogPosts$ = this.blogPostService.GetAllCategories();
  }

}
