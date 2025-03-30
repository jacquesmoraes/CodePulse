import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { BlogPost } from '../models/blog-post.model';
import { BlogPostService } from '../services/blog-post.service';
import { ViewportScroller } from '@angular/common';

@Component({
  selector: 'app-details-blogpost',
  templateUrl: './details-blogpost.component.html',
  styleUrls: ['./details-blogpost.component.css']
})
export class BlogPostDetailsComponent implements OnInit {
  blogPost?: BlogPost;
  isLoading: boolean = true;
  error: string | null = null;

  constructor(
    private route: ActivatedRoute,
    private blogPostService: BlogPostService,
    private viewportScroller: ViewportScroller
  ) {}

  ngOnInit(): void {
    // Busca o post pelo parâmetro "id" na rota
    this.viewportScroller.scrollToPosition([0, 0]);
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.blogPostService.GetBlogPostById(id).subscribe({
        next: (post: BlogPost) => {
          this.blogPost = post;
          this.isLoading = false;
        },
        error: (err) => {
          console.error('Erro ao carregar o post:', err);
          this.error = 'Erro ao carregar o post.';
          this.isLoading = false;
        }
      });
    } else {
      this.error = 'Post não encontrado.';
      this.isLoading = false;
    }
  }
}
