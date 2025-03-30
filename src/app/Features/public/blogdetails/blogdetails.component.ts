import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { BlogPost } from '../../blog-post/models/blog-post.model';
import { Observable } from 'rxjs';
import { BlogPostService } from '../../blog-post/services/blog-post.service';
import { ViewportScroller } from '@angular/common';
import { BlogPostComment } from '../../Comments/models/blogpost-comment.model';
import { CommentsService } from '../../Comments/comments.service';
import { AddCommentRequest } from '../../Comments/models/add-comment-request.model';
import { AuthService } from '../../auth/services/auth.service';
import { User } from '../../auth/models/user.model';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-blogdetails',
  templateUrl: './blogdetails.component.html',
  styleUrls: ['./blogdetails.component.css']
})
export class BlogdetailsComponent implements OnInit {

  url: string | null = null;
  blogposts$?: Observable<BlogPost>;
  error: string | null = null;
  comments: BlogPostComment[] = [];
  showCommentForm: boolean = false;
  newComment: string = '';
  blogPostId: string | undefined;
  user?: User;
  canComment: boolean = false;

  constructor(
    private route: ActivatedRoute,
    private blogpost: BlogPostService,
    private viewportScroller: ViewportScroller,
    private commentService: CommentsService,
    private authService: AuthService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.viewportScroller.scrollToPosition([0, 0]);

    this.authService.user().subscribe(u => {
      this.user = u;
      this.canComment = !!u && u.roles.includes('Reader');
    });

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
              this.loadComments(post.id);
            },
            error: () => {
              this.error = 'Erro ao carregar o post.';
            }
          });
        }
      }
    });
  }

  loadComments(postId: string): void {
    this.commentService.getCommentByPost(postId).subscribe({
      next: (response) => {
        this.comments = response;
      },
      error: (err) => console.log('Erro ao carregar comentários:', err)
    });
  }

  submitComment(): void {
    if (!this.newComment.trim() || !this.blogPostId) return;

    const comment: AddCommentRequest = {
      blogPostId: this.blogPostId,
      content: this.newComment
    };

    this.commentService.addComment(comment).subscribe({
      next: (response) => {
        this.comments.unshift(response);
        this.newComment = '';
        this.showCommentForm = false;
      },
      error: (err) => {
        console.error('Erro ao enviar comentário:', err);
      }
    });
  }

  promptLogin(): void {
    Swal.fire({
      title: 'Faça login para comentar',
      text: 'Você precisa estar logado como leitor para comentar neste post.',
      icon: 'info',
      showCancelButton: true,
      confirmButtonText: 'Fazer login',
      cancelButtonText: 'Cancelar'
    }).then((result) => {
      if (result.isConfirmed) {
        this.router.navigateByUrl('/admin/categories'); // ajuste a rota de login se necessário
      }
    });
  }
}
