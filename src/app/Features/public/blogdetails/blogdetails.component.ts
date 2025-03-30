import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { BlogPost } from '../../blog-post/models/blog-post.model';
import { Observable } from 'rxjs';
import { BlogPostService } from '../../blog-post/services/blog-post.service';
import { ViewportScroller } from '@angular/common';

@Component({
  selector: 'app-blogdetails',
  templateUrl: './blogdetails.component.html',
  styleUrls: ['./blogdetails.component.css']
})
export class BlogdetailsComponent implements OnInit {
   
url: string | null = null;
blogposts$? : Observable<BlogPost>
error: string | null = null;

  constructor(private route:ActivatedRoute, private blogpost : BlogPostService,private viewportScroller: ViewportScroller){

  }
  ngOnInit(): void {
    this.viewportScroller.scrollToPosition([0, 0]);
   this.route.paramMap.subscribe({
    next: (params) => {
      this.url =  params.get('url')
    },
    error: (err) => {
      console.error('Erro ao carregar o post:', err);
          this.error = 'Erro ao carregar o post.';
       
    }
   })
   if(this.url){
   this.blogposts$ = this.blogpost.GetBlogPostByUrlHandle(this.url);
   }
  }
  
}
