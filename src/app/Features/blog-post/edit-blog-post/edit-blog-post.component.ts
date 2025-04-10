import { Component, OnInit, OnDestroy, ChangeDetectorRef } from '@angular/core';
import { BlogPost } from '../models/blog-post.model';
import { ActivatedRoute, Router } from '@angular/router';
import { BlogPostService } from '../services/blog-post.service';
import { Observable, Subscription } from 'rxjs';
import { CategoryService } from '../../Categories/services/category.service';
import { Category } from '../../Categories/models/category.model';
import { UpdateBlogPost } from '../models/update-blog-post.model';
import { SelectedImage } from 'src/app/shared/models/selected-images.model';
import { ImageSelectorService } from 'src/app/shared/components/image-selector.service';
import { BlogImage } from 'src/app/shared/models/blog-image.model';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-edit-blog-post',
  templateUrl: './edit-blog-post.component.html',
  styleUrls: ['./edit-blog-post.component.css']
})
export class EditBlogPostComponent implements OnInit, OnDestroy {
  id?: string;
  blogPost?: BlogPost;
  private subscription?: Subscription;
  private updateBlogPostSubscription?: Subscription;
  
  categories$?: Observable<Category[]>;
  selectedCategories?: string[];
  isImageSelectorVisible: boolean = false;
  pendingImage: SelectedImage | null = null;
  pendingImageMessage: string = '';
  displayImageUrl: string = '';
  baseUrl: string = environment.apiBaseUrl;

  constructor(
    private route: ActivatedRoute,
    private blogPostService: BlogPostService,
    private categoryService: CategoryService,
    public router: Router,
    private imageSelectorService: ImageSelectorService,
    private cdr: ChangeDetectorRef
  ) {}

  ngOnInit(): void {
    this.categories$ = this.categoryService.getAllCategories();
    this.id = this.route.snapshot.paramMap.get('id') || '';
    if (this.id) {
      this.subscription = this.blogPostService.GetBlogPostById(this.id).subscribe({
        next: (response) => {
          console.log(this.blogPost?.featuredImageUrl);
          this.blogPost = response;
          this.selectedCategories = response.categories.map(x => x.id);
          this.displayImageUrl = this.blogPost.featuredImageUrl || '';
        }
      });
    }
    
  }

  openImageSelector(): void {
    this.isImageSelectorVisible = true;
  }

  closeImageSelector(): void {
    this.isImageSelectorVisible = false;
  }

  // Método chamado quando o ImageSelectorComponent emite o objeto SelectedImage
  onImageSelected(selectedImage: SelectedImage): void {
    this.pendingImage = selectedImage;
    this.pendingImageMessage = `Imagem "${selectedImage.fileName}" selecionada. Será enviada ao salvar.`;
    
    
    this.displayImageUrl = `${this.baseUrl}/images/${selectedImage.fileName}`;

    // Atualiza o campo da imagem para mostrar o preview
    if (typeof selectedImage.preview === 'string' && this.blogPost) {
      this.blogPost.featuredImageUrl = selectedImage.preview; 
    }
  
    this.closeImageSelector();
    this.cdr.detectChanges();
  }

  onSubmit(): void {
    console.log("enviou");
    if (this.blogPost && this.id) {
      if (this.pendingImage) {
        // Se houver imagem pendente, faz o upload primeiro
        this.imageSelectorService.uploadImage(this.pendingImage.file, this.pendingImage.fileName)
          .subscribe({
            next: (response: BlogImage) => {
              // Atualiza a URL da imagem com a resposta definitiva do backend
              this.blogPost!.featuredImageUrl = response.url;
              this.displayImageUrl = response.url;
              this.pendingImageMessage = '';
              this.updatePost();
            },
            error: (error) => {
              console.error("Erro ao fazer upload da imagem", error);
              this.pendingImageMessage = 'Erro ao fazer upload da imagem. Tente novamente.';
            }
          });
      } else {
        // Se não houver imagem pendente, atualiza o post direto
        this.updatePost();
      }
    }
  }

  private updatePost(): void {
    const updateBlogPost: UpdateBlogPost = {
      title: this.blogPost!.title,
      shortDescription: this.blogPost!.shortDescription,
      content: this.blogPost!.content,
      featuredImageUrl: this.blogPost!.featuredImageUrl,
      urlHandle: this.blogPost!.urlHandle,
      publishedDate: this.blogPost!.publishedDate,
      
      isVisible: this.blogPost!.isVisible,
      categories: this.selectedCategories ?? []
    };

    this.updateBlogPostSubscription = this.blogPostService.updateBlogPost(this.id!, updateBlogPost)
      .subscribe({
        next: (response) => {
          this.router.navigateByUrl('/dashboard');
        }
      });
  }

  ngOnDestroy(): void {
    this.subscription?.unsubscribe();
    this.updateBlogPostSubscription?.unsubscribe();
  }
}
