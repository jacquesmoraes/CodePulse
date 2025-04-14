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
  mostViewedPosts: BlogPost[] = [];
  relatedPosts: BlogPost[] = []; // ✅ NOVO: posts relacionados por categoria
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

              this.loadDisqus(this.blogPostId, post.urlHandle);
              this.loadMostViewedPosts();
              this.loadRelatedPosts(this.blogPostId); // ✅ NOVO: carrega posts relacionados

              this.spinner.hide();
            },
            error: () => {
              this.error = 'Erro ao carregar o post.';
              this.spinner.hide();
            }
          });
        }
      }
    });
  }

  loadMostViewedPosts(): void {
    this.blogpost.getMostViewedPosts(5).subscribe({
      next: (posts: BlogPost[]) => {
        this.mostViewedPosts = posts;
      },
      error: () => {
        console.error('Erro ao carregar posts populares.');
      }
    });
  }

  loadRelatedPosts(postId: string): void {
    this.blogpost.getRelatedPosts(postId).subscribe({
      next: (posts: BlogPost[]) => {
        this.relatedPosts = posts;
      },
      error: () => {
        console.error('Erro ao carregar posts relacionados.');
      }
    });
  }

  loadDisqus(postId: string, urlHandle: string): void {
    const pageUrl = window.location.href;
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

  shareOnTwitter() {
    const url = window.location.href;
    window.open(`https://twitter.com/intent/tweet?url=${url}`, '_blank');
  }
  
  shareOnFacebook() {
    const url = window.location.href;
    window.open(`https://www.facebook.com/sharer/sharer.php?u=${url}`, '_blank');
  }
  
  shareOnLinkedIn() {
    const url = window.location.href;
    window.open(`https://www.linkedin.com/sharing/share-offsite/?url=${url}`, '_blank');
  }
}
