import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ImageOptimizationService {
  
  constructor() { }

  /**
   * Pré-carrega uma imagem para melhorar o LCP
   * @param imageUrl URL da imagem a ser pré-carregada
   * @returns Promise que resolve quando a imagem é carregada
   */
  preloadImage(imageUrl: string): Promise<void> {
    return new Promise((resolve, reject) => {
      const img = new Image();
      img.src = imageUrl;
      img.onload = () => {
        console.log('Imagem pré-carregada:', imageUrl);
        resolve();
      };
      img.onerror = () => {
        console.error('Erro ao pré-carregar imagem:', imageUrl);
        reject();
      };
    });
  }

  /**
   * Otimiza a URL da imagem para melhorar o carregamento
   * @param imageUrl URL original da imagem
   * @param width Largura desejada
   * @param height Altura desejada
   * @returns URL otimizada da imagem
   */
  optimizeImageUrl(imageUrl: string, width?: number, height?: number): string {
    // Se a URL já for de um serviço de CDN ou otimização, retorna a URL original
    if (imageUrl.includes('cloudinary') || imageUrl.includes('imgix') || imageUrl.includes('cloudflare')) {
      return imageUrl;
    }

    // Aqui você pode adicionar lógica para otimizar a URL da imagem
    // Por exemplo, adicionar parâmetros de tamanho, qualidade, etc.
    // Esta é uma implementação básica que pode ser expandida conforme necessário
    
    // Se a URL for relativa, adiciona o domínio base
    if (imageUrl.startsWith('/')) {
      imageUrl = `${window.location.origin}${imageUrl}`;
    }
    
    return imageUrl;
  }
} 