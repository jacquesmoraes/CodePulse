import { Component, OnInit } from '@angular/core';
import { AddBlogPost } from '../models/add-blog-post.model';
import { BlogPostService } from '../services/blog-post.service';
import { Router } from '@angular/router';
import { CategoryService } from '../../Categories/services/category.service';
import { Observable } from 'rxjs';
import { Category } from '../../Categories/models/category.model';
import { SelectedImage } from 'src/app/shared/models/selected-images.model';
import { ImageSelectorService } from 'src/app/shared/components/image-selector.service';
import { BlogImage } from 'src/app/shared/models/blog-image.model';

@Component({
  selector: 'app-add-blogpost',
  templateUrl: './add-blogpost.component.html',
  styleUrls: ['./add-blogpost.component.css']
})
export class AddBlogpostComponent implements OnInit {
  model: AddBlogPost;
  category$?: Observable<Category[]>;
  isImageSelectorVisible: boolean = false;
  pendingImage: SelectedImage | null = null;

  constructor(
    private blogPostService: BlogPostService,
    private router: Router,
    private categoryService: CategoryService,
    private imageSelectorService: ImageSelectorService
  ) {
    this.model = {
      title: '',
      shortDescription: '',
      urlHandle: '',
      content: '',
      featuredImageUrl: '',
      author: '',
      isVisible: true,
      publishedDate: new Date(),
      categories: []
    };
  }

  ngOnInit(): void {
    this.category$ = this.categoryService.getAllCategories();
  }

  openImageSelector(): void {
    this.isImageSelectorVisible = true;
  }

  closeImageSelector(): void {
    this.isImageSelectorVisible = false;
  }

  // Recebe o objeto SelectedImage emitido pelo ImageSelectorComponent
  onImageSelected(selectedImage: SelectedImage): void {
  console.log("Imagem selecionada recebida:", selectedImage);
  this.pendingImage = selectedImage;

  // Atualiza o preview da imagem corretamente
   if (selectedImage.preview) {
    setTimeout(() => {
      this.model.featuredImageUrl = selectedImage.preview as string;
      console.log("Campo atualizado:", this.model.featuredImageUrl);
    }, 100); // 🔥 Pequeno atraso para garantir que o Angular detecte a mudança
  }

  this.closeImageSelector();
}

  onSubmit(): void {
    if (this.pendingImage) {
      // Se houver imagem pendente, realiza o upload primeiro.
      this.imageSelectorService.uploadImage(this.pendingImage.file, this.pendingImage.fileName)
        .subscribe({
          next: (response: BlogImage) => {
            // Atualiza o model com a URL definitiva retornada do backend.
            this.model.featuredImageUrl = response.url;
            this.createPost();
          },
          error: (error) => {
            console.error("Erro ao fazer upload da imagem", error);
          }
        });
    } else {
      // Se não houver imagem pendente, envia o post diretamente.
      this.createPost();
    }
  }

  private createPost(): void {
    console.log("Enviando post:", this.model);
    this.blogPostService.createBlogPost(this.model).subscribe({
      next: (response) => {
        this.router.navigateByUrl('/admin/blogpost');
      }
    });
  }
}
