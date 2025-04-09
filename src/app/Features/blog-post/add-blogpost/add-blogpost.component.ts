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
import { environment } from 'src/environments/environment';

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
  pendingImageMessage: string = '';
  displayImageUrl: string = '';
    baseUrl: string = environment.apiBaseUrl;
  constructor(
    private blogPostService: BlogPostService,
    public router: Router,
    private categoryService: CategoryService,
    private imageSelectorService: ImageSelectorService,
    
    
  ) {
    this.model = {
      title: '',
      shortDescription: '',
      urlHandle: '',
      content: '',
      featuredImageUrl: '',
     
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

  
  onImageSelected(selectedImage: SelectedImage): void {
    this.pendingImage = selectedImage;
    this.pendingImageMessage = `Imagem "${selectedImage.fileName}" selecionada. Será enviada ao salvar.`;
    
    // Mostra o caminho completo da imagem no input
    // Assumindo que a URL será no formato: {Request.Scheme}://{Request.Host}/{savedImage.Url}
    // Vamos usar o baseUrl do ambiente como aproximação
    this.displayImageUrl = `${this.baseUrl}/images/${selectedImage.fileName}`;


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
