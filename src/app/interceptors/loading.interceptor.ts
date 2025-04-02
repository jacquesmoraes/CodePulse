import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor
} from '@angular/common/http';
import { delay, finalize, Observable } from 'rxjs';
import { LoaderService } from '../shared/loader.service';

@Injectable()
export class LoadingInterceptor implements HttpInterceptor {

  constructor(private loadingService : LoaderService) {}

  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    console.log('Interceptando:', request.url);
    this.loadingService.busy()
    return next.handle(request).pipe(
      delay(1000),
      finalize(() => {
        this.loadingService.idle()
      })
    );
  }
}
