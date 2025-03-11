import { Component, OnDestroy, OnInit } from '@angular/core';
import { BlogPost } from '../models/blog-post.model';
import { BlogPostService } from '../services/blog-post.service';
import { Observable, Subscription } from 'rxjs';
import Swal from 'sweetalert2';
import { Router } from '@angular/router';

@Component({
  selector: 'app-blogpost-list',
  templateUrl: './blogpost-list.component.html',
  styleUrls: ['./blogpost-list.component.css']
})
export class BlogpostListComponent implements OnInit, OnDestroy {

  id?: string;
  blogPosts$? : Observable<BlogPost[]>;
  blogPosts: BlogPost[] =[];
  deleteSubscription?:Subscription;
  
  constructor(private blogPostService: BlogPostService, private router: Router){

  }
 

  ngOnInit(): void {
    this.blogPostService.GetAllBlogPosts().subscribe(posts => {
       
      this.blogPosts = posts; // 🔥 Agora os posts são armazenados corretamente
    });
    
  }

  loadBlogPosts(): void {
    this.blogPostService.GetAllBlogPosts().subscribe(posts => {
      this.blogPosts = posts; 
    });
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
            this.loadBlogPosts(); // 🔥 Atualiza a lista sem precisar recarregar a página
          },
          error: () => {
            Swal.fire("Erro!", "Não foi possível excluir o post.", "error");
          }
        });
      }
    });
  }

  ngOnDestroy(): void {
    this.deleteSubscription?.unsubscribe();
  }

}
