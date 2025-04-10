import { Component, EventEmitter, Input, Output } from '@angular/core';
import { BlogPost } from 'src/app/Features/blog-post/models/blog-post.model';
import { BlogPostService } from 'src/app/Features/blog-post/services/blog-post.service';

@Component({
  selector: 'app-writer-posts-list',
  templateUrl: './writer-posts-list.component.html',
  styleUrls: ['./writer-posts-list.component.css']
})
export class WriterPostsListComponent {
  @Input() posts: BlogPost[] = [];
  @Output() viewAllPosts = new EventEmitter<void>();
  

  



}
