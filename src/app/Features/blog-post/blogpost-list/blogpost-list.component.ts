import { Component, OnInit, OnDestroy } from '@angular/core';
import { BlogPost } from '../models/blog-post.model';
import { BlogPostService } from '../services/blog-post.service';
import { Subscription } from 'rxjs';
import Swal from 'sweetalert2';
import { User } from '../../auth/models/user.model';
import { AuthService } from '../../auth/services/auth.service';
@Component({
  selector: 'app-blogpost-list',
  templateUrl: './blogpost-list.component.html',
  styleUrls: ['./blogpost-list.component.css']
})
export class BlogpostListComponent implements OnInit, OnDestroy {

  blogPosts: BlogPost[] = [];

  // Filtros e paginação
  query?: string;
  sortBy: string = 'PublishedDate';
  sortDirection: string = 'desc';
  pageNumber = 1;
  pageSize = 5;
  totalCount?: number;
  totalPagesList: number[] = [];

  private deleteSubscription?: Subscription;
  private currentUser?: User;

  constructor(
    private blogPostService: BlogPostService,
    private authService: AuthService
  ) {}

  ngOnInit(): void {
    this.currentUser = this.authService.getUser();
    this.refreshBlogPostList();
  }

  refreshBlogPostList(): void {
    if (this.isWriterOnly()) {
      // Writer não precisa de contagem paginada (a não ser que deseje implementar)
      this.loadBlogPosts();
    } else {
      this.blogPostService.getBlogPostsCount().subscribe({
        next: (count) => {
          this.totalCount = count;
          const totalPages = Math.ceil(count / this.pageSize);
          this.totalPagesList = Array.from({ length: totalPages }, (_, i) => i + 1);
          this.loadBlogPosts();
        }
      });
    }
  }

  private loadBlogPosts(): void {
    if (this.isWriterOnly()) {
      this.blogPostService.getMyPosts().subscribe(posts => {
        this.blogPosts = posts;
      });
    } else {
      this.blogPostService.GetAllBlogPosts(
        this.query,
        this.sortBy,
        this.sortDirection,
        this.pageSize,
        this.pageNumber
      ).subscribe(posts => {
        this.blogPosts = posts;
      });
    }
  }

  onDelete(post: BlogPost): void {
    Swal.fire({
      title: `Excluir "${post.title}"?`,
      text: "Essa ação não pode ser desfeita!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#d33",
      cancelButtonColor: "#3085d6",
      confirmButtonText: "Sim, excluir!",
      cancelButtonText: "Cancelar"
    }).then((result) => {
      if (result.isConfirmed) {
        this.deleteSubscription = this.blogPostService.deleteBlogPost(post.id).subscribe({
          next: () => {
            Swal.fire("Deletado!", "O post foi removido com sucesso.", "success");
            this.refreshBlogPostList();
          },
          error: () => {
            Swal.fire("Erro!", "Não foi possível excluir o post.", "error");
          }
        });
      }
    });
  }

  onSearch(query: string): void {
    this.query = query;
    this.pageNumber = 1;
    this.loadBlogPosts();
  }

  sort(sortBy: string, direction: string): void {
    this.sortBy = sortBy === 'date' ? 'PublishedDate' : 'Author';
    this.sortDirection = direction;
    this.pageNumber = 1;
    this.loadBlogPosts();
  }

  getPage(pageNumber: number): void {
    this.pageNumber = pageNumber;
    this.loadBlogPosts();
  }

  nextPage(): void {
    if (this.pageNumber < this.totalPagesList.length) {
      this.pageNumber++;
      this.loadBlogPosts();
    }
  }

  previousPage(): void {
    if (this.pageNumber > 1) {
      this.pageNumber--;
      this.loadBlogPosts();
    }
  }

  ngOnDestroy(): void {
    this.deleteSubscription?.unsubscribe();
  }

  private isWriterOnly(): boolean {
    const roles = this.currentUser?.roles || [];
    return roles.includes('Writer') && !roles.includes('Admin');
  }
}
