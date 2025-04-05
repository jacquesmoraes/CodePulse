import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor
} from '@angular/common/http';
import { Observable } from 'rxjs';
import { CookieService } from 'ngx-cookie-service';

@Injectable()
export class AuthInterceptor implements HttpInterceptor {

  constructor(private cookieService: CookieService) {}

  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    const token = this.cookieService.get('Authorization');

    // Só adiciona o token se a URL for da sua API
    if (token && request.url.startsWith('https://localhost:7167')) {
      const authRequest = request.clone({
        setHeaders: {
          Authorization: token
        }
      });
      return next.handle(authRequest);
    }

    return next.handle(request);
  }
}
