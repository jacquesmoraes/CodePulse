import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { BlogPost } from '../../blog-post/models/blog-post.model';
import { Observable } from 'rxjs';
import { BlogPostService } from '../../blog-post/services/blog-post.service';
import { ViewportScroller } from '@angular/common';

import { User } from '../../auth/models/user.model';
import { NgxSpinnerService } from 'ngx-spinner';


@Component({
  selector: 'app-blogdetails',
  templateUrl: './blogdetails.component.html',
  styleUrls: ['./blogdetails.component.css']
})
export class BlogdetailsComponent implements OnInit {

  url: string | null = null;
  blogposts$?: Observable<BlogPost>;
  error: string | null = null;

  showCommentForm: boolean = false;
  newComment: string = '';
  blogPostId: string | undefined;
  user?: User;
 

  constructor(
    private route: ActivatedRoute,
    private blogpost: BlogPostService,
    private viewportScroller: ViewportScroller,
    private spinner: NgxSpinnerService
    
  ) {}

  ngOnInit(): void {
    this.spinner.show();
    this.viewportScroller.scrollToPosition([0, 0]);

    this.route.paramMap.subscribe({
      next: (params) => {
        this.url = params.get('url');
        if (this.url) {
          this.blogpost.GetBlogPostByUrlHandle(this.url).subscribe({
            next: (post) => {
              this.blogposts$ = new Observable<BlogPost>((observer) => {
                observer.next(post);
                observer.complete();
              });
              this.blogPostId = post.id;
              this.loadDisqus(this.blogPostId, post.urlHandle)
             
            },
            error: () => {
              this.error = 'Erro ao carregar o post.';
            }
          });
        }
      }
    });
  }

 
  loadDisqus(postId: string, urlHandle: string): void {
    const pageUrl = window.location.href; // ou use sua lógica de URL
    const pageIdentifier = postId;
  
    (window as any).disqus_config = function () {
      this.page.url = pageUrl;
      this.page.identifier = pageIdentifier;
    };
  
    const d = document;
    const s = d.createElement('script');
    s.src = 'https://codepulse-blog.disqus.com/embed.js';
    s.setAttribute('data-timestamp', Date.now().toString());
    (d.head || d.body).appendChild(s);
  }
  

 
}
