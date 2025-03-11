import { Injectable } from '@angular/core';
import { AddBlogPost } from '../models/add-blog-post.model';
import { Observable } from 'rxjs';
import { BlogPost } from '../models/blog-post.model';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { UpdateBlogPost } from '../models/update-blog-post.model';

@Injectable({
  providedIn: 'root'
})
export class BlogPostService {

  constructor(private http: HttpClient) { }

  createBlogPost(data: AddBlogPost): Observable<BlogPost> {
    return this.http.post<BlogPost>(`${environment.apiBaseUrl}/api/blogpost`, data);

  }

  GetAllBlogPosts() : Observable<BlogPost[]>{
      return this.http.get<BlogPost[]>(`${environment.apiBaseUrl}/api/blogpost`);
  }
  GetBlogPostById(id: string) : Observable<BlogPost>{
    return this.http.get<BlogPost>(`${environment.apiBaseUrl}/api/blogpost/${id}`);
  }

  updateBlogPost(id: string, updateblogpost: UpdateBlogPost): Observable<BlogPost>{
      return this.http.put<BlogPost>(`${environment.apiBaseUrl}/api/blogpost/${id}`, updateblogpost);
  }

  deleteBlogPost(id:string):Observable<BlogPost>{
    return this.http.delete<BlogPost>(`${environment.apiBaseUrl}/api/blogpost/${id}`);

  }
}
