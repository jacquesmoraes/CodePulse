import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

import { BlogImage } from '../models/blog-image.model';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ImageSelectorService {
  

  constructor(private http: HttpClient) { }

  uploadImage(file: File, fileName: string): Observable<BlogImage>{
    const formData = new FormData();
    formData.append('file', file);
    formData.append('fileName', fileName);
    return this.http.post<BlogImage>(`${environment.apiBaseUrl}/api/images`, formData);

  }


}
