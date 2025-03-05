import { Injectable } from '@angular/core';
import { AddBlogPost } from '../models/add-blog-post.model';
import { Observable } from 'rxjs';
import { blogPost } from '../models/blog-post.model';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class BlogPostService {

  constructor(private http: HttpClient) { }

  createBlogPost(data: AddBlogPost): Observable<blogPost> {
    return this.http.post<blogPost>(`${environment.apiBaseUrl}/api/blogpost`, data);

  }

  GetAllCategories() : Observable<blogPost[]>{
      return this.http.get<blogPost[]>(`${environment.apiBaseUrl}/api/blogpost`);
  }
}
