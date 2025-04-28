import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { BlogPost } from '../../blog-post/models/blog-post.model';
import { Observable } from 'rxjs';
import { BlogPostService } from '../../blog-post/services/blog-post.service';
import { User } from '../../auth/models/user.model';
import { NgxSpinnerService } from 'ngx-spinner';
import { FavoriteService } from '../../favorite/favorite.service';
import { AuthService } from '../../auth/services/auth.service';
import { ToastrService } from 'ngx-toastr';

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
  relatedPosts: BlogPost[] = [];
  showCommentForm: boolean = false;
  newComment: string = '';
  blogPostId: string | undefined;
  user?: User;
  isFavorited: boolean = false;
  isAuthenticated: boolean = false;

  constructor(
    private route: ActivatedRoute,
    private blogpost: BlogPostService,
    
    private favoriteService: FavoriteService,
    private authService: AuthService,
    private toastr: ToastrService
  ) {}

  ngOnInit(): void {
    
    
 
    this.isAuthenticated = !!this.authService.getUser(); 
    
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

              // Verifica se o post está nos favoritos
              if (this.isAuthenticated && this.blogPostId) {
                this.favoriteService.isFavorite(this.blogPostId).subscribe({
                  next: (res) => {
                    this.isFavorited = res;
                     },
                  error: () => {
                    this.isFavorited = false;
                  }
                });
                 
              }

              this.loadDisqus(this.blogPostId, post.urlHandle);
              this.loadMostViewedPosts();
              this.loadRelatedPosts(this.blogPostId);

              
            },
            error: () => {
              this.error = 'Erro ao carregar o post.';
              
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
  
    const disqus = (window as any).DISQUS;
  
    if (disqus) {
      disqus.reset({
        reload: true,
        config: function () {
          this.page.url = pageUrl;
          this.page.identifier = pageIdentifier;
        }
      });
    } else {
      const d = document;
      const s = d.createElement('script');
      s.src = 'https://codepulse-blog.disqus.com/embed.js';
      s.setAttribute('data-timestamp', Date.now().toString());
      s.async = true;
      (d.head || d.body).appendChild(s);
    }
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

  addToFavorites(): void {
    if (!this.blogPostId || this.isFavorited) return;

    this.favoriteService.addFavorite(this.blogPostId).subscribe({
      next: () => {
        this.isFavorited = true;
        this.toastr.success('Post salvo nos favoritos!');
      },
      error: (error) => {
        if (error.status === 400) {
          this.isFavorited = true;
          this.toastr.info('Este post já está nos seus favoritos');
        } else {
          this.toastr.error('Erro ao salvar nos favoritos');
        }
      }
    });
  }
}