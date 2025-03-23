import { Component, EventEmitter, Input, Output } from '@angular/core';
import { SelectedImage } from '../../models/selected-images.model';
import { BlogImage } from '../../models/blog-image.model';
import { ImageSelectorService } from '../image-selector.service';

@Component({
  selector: 'app-image-selector',
  templateUrl: './image-selector.component.html'
})
export class ImageSelectorComponent {
  @Output() imageSelected: EventEmitter<SelectedImage> = new EventEmitter<SelectedImage>();
  @Output() modalClosed: EventEmitter<void> = new EventEmitter<void>(); // 🔥 Para fechar o modal no pai

  @Input() isVisible: boolean = false; // 🔥 Controla a exibição do modal

  selectedFile: File | null = null;
  filename: string = '';
  imagePreview: string | ArrayBuffer | null = null;

  // Captura a seleção do arquivo e gera o preview
  onFileSelected(event: any): void {
    if (event.target.files && event.target.files[0]) {
      const file: File = event.target.files[0];
      this.selectedFile = file;
      const reader = new FileReader();
      reader.onload = () => {
        this.imagePreview = reader.result;
        console.log("Preview gerado:", this.imagePreview);
      };
      reader.readAsDataURL(file);
    }
  }
  

  

  // Emite os dados da imagem (sem fazer upload) para o componente pai
  confirmSelection(): void {
    if (!this.selectedFile || !this.filename) {
      console.warn("Por favor, selecione um arquivo e informe um nome.");
      return;
    }
    const selectedImage: SelectedImage = {
      file: this.selectedFile,
      fileName: this.filename,
      preview: this.imagePreview
    };
    console.log("Emitting selected image:", selectedImage);
    this.imageSelected.emit(selectedImage);
    this.closeModal(); 
  }
  closeModal(): void {
    this.imagePreview = null; // 🔥 Reseta o preview
    this.selectedFile = null; // 🔥 Limpa o arquivo selecionado
    this.filename = ''; // 🔥 Reseta o nome do arquivo
    this.modalClosed.emit(); // 
  }

}
