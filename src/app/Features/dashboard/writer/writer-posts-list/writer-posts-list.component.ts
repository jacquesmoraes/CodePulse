import { Component, Input, OnInit } from '@angular/core';
import { BlogPost } from 'src/app/Features/blog-post/models/blog-post.model';
import { UserProfile } from 'src/app/profile/models/user-profile.model';
import { AdminUserService } from '../../admin/admin-user.service';
import { BlogPostService } from 'src/app/Features/blog-post/services/blog-post.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-writer-posts-list',
  templateUrl: './writer-posts-list.component.html',
  styleUrls: ['./writer-posts-list.component.css']
})
export class WriterPostsListComponent implements OnInit {
  @Input() posts: BlogPost[] = [];
  @Input() isAdmin: boolean = false;
  
  authors: UserProfile[] = [];
  filteredPosts: BlogPost[] = [];
  selectedAuthor: string = '';
  searchTerm: string = '';

  constructor(
    private adminUserService: AdminUserService,
    private blogPostService: BlogPostService,
    private toastr: ToastrService
  ) {}

  ngOnInit(): void {
    this.filteredPosts = this.posts;

    // Buscar lista de writers apenas se for admin
    if (this.isAdmin) {
      this.loadAuthors();
    }
  }

  private loadAuthors(): void {
    this.adminUserService.getAllWriters().subscribe({
      next: (data) => {
        this.authors = data;
      },
      error: (error) => {
        console.error('Erro ao buscar autores:', error);
        this.toastr.error('Não foi possível carregar a lista de autores. Por favor, tente novamente mais tarde.');
      }
    });
  }

  filterPosts() {
    this.filteredPosts = this.posts.filter(post => {
      const matchesAuthor = this.selectedAuthor ? post.author.userName === this.selectedAuthor : true;
      const matchesSearch = this.searchTerm
        ? post.title.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
          post.content.toLowerCase().includes(this.searchTerm.toLowerCase())
        : true;

      return matchesAuthor && matchesSearch;
    });
  }

  deletePost(postId: string) {
    if (confirm('Tem certeza que deseja excluir este post?')) {
      this.blogPostService.deleteBlogPost(postId).subscribe({
        next: () => {
          this.toastr.success('Post excluído com sucesso!');
          this.posts = this.posts.filter(post => post.id !== postId);
          this.filterPosts(); // Atualiza a lista filtrada
        },
        error: () => {
          this.toastr.error('Erro ao excluir o post');
        }
      });
    }
  }
}