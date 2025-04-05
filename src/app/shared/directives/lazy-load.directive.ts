import { Directive, ElementRef, HostListener, Renderer2 } from '@angular/core';

@Directive({
  selector: '[appLazyLoad]'
})
export class LazyLoadDirective {

  constructor(private el: ElementRef, private renderer: Renderer2) {
    // Inicialmente deixa a imagem invisível
    this.renderer.setStyle(this.el.nativeElement, 'opacity', '0');
    this.renderer.setStyle(this.el.nativeElement, 'transition', 'opacity 0.5s ease-in-out');
  }

  @HostListener('load')
  onLoad(): void {
    this.renderer.setStyle(this.el.nativeElement, 'opacity', '1');
  }

  @HostListener('error')
  onError(): void {
    // Se quiser adicionar uma imagem fallback, pode fazer aqui
    this.renderer.setAttribute(this.el.nativeElement, 'src', 'assets/img/fallback.jpg');
  }
}
