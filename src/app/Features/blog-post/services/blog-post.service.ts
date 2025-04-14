import { Injectable } from '@angular/core';
import { AddBlogPost } from '../models/add-blog-post.model';
import { Observable } from 'rxjs';
import { BlogPost } from '../models/blog-post.model';
import { HttpClient, HttpParams } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { UpdateBlogPost } from '../models/update-blog-post.model';

@Injectable({
  providedIn: 'root'
})
export class BlogPostService {

  constructor(private http: HttpClient) { }

  createBlogPost(data: AddBlogPost): Observable<BlogPost> {
    return this.http.post<BlogPost>(`${environment.apiBaseUrl}/api/blogpost?addAuth=true`, data);

  }

  GetAllBlogPosts(query?: string,
    sortBy?: string,
    sortDirection?: string,
    pageSize?: number,
    pageNumber?: number,

  ): Observable<BlogPost[]> {
    let params = new HttpParams();

    if (query) {
      params = params.set('query', query);
    }
    if (sortBy) {
      params = params.set('sortBy', sortBy);
    }
    if (sortDirection) {
      params = params.set('sortDirection', sortDirection);
    }
    if (pageSize) {
      params = params.set('pageSize', pageSize);
    }
    if (pageNumber) {
      params = params.set('pageNumber', pageNumber);
    }
    return this.http.get<BlogPost[]>(`${environment.apiBaseUrl}/api/blogpost`, {
      params: params
    });
  }
  GetBlogPostById(id: string): Observable<BlogPost> {
    return this.http.get<BlogPost>(`${environment.apiBaseUrl}/api/blogpost/${id}`);
  }
  GetBlogPostByUrlHandle(urlHandle: string): Observable<BlogPost> {
    return this.http.get<BlogPost>(`${environment.apiBaseUrl}/api/blogpost/${urlHandle}`);
  }

  updateBlogPost(id: string, updateblogpost: UpdateBlogPost): Observable<BlogPost> {
    return this.http.put<BlogPost>(`${environment.apiBaseUrl}/api/blogpost/${id}?addAuth=true`, updateblogpost);
  }

  deleteBlogPost(id: string): Observable<BlogPost> {
    return this.http.delete<BlogPost>(`${environment.apiBaseUrl}/api/blogpost/${id}?addAuth=true`);

  }

  getRelatedPosts(postId: string): Observable<BlogPost[]> {
    return this.http.get<BlogPost[]>(`${environment.apiBaseUrl}/api/blogpost/related/${postId}`);
  }
  
  getBlogPostsCount(): Observable<number>{
    return this.http.get<number>(`${environment.apiBaseUrl}/api/blogpost/count`)
  }

  getMostViewedPosts(count: number = 5): Observable<BlogPost[]>{
    return this.http.get<BlogPost[]>(`${environment.apiBaseUrl}/api/blogpost/mostpopular?count=${count}`)
  }

  getMyPosts() : Observable<BlogPost[]>{
    return this.http.get<BlogPost[]>(`${environment.apiBaseUrl}/api/blogpost/my-posts?addAuth=true`); 
  }


}
