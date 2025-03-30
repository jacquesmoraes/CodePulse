import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { BlogPostComment } from './models/blogpost-comment.model';
import { environment } from 'src/environments/environment';
import { AddCommentRequest } from './models/add-comment-request.model';

@Injectable({
  providedIn: 'root'
})
export class CommentsService {

  constructor(private httpClient: HttpClient) { }

  getCommentByPost(postId: string): Observable<BlogPostComment[]> {
    return this.httpClient.get<BlogPostComment[]>(
      `${environment.apiBaseUrl}/api/comment/${postId}`
      
    );
  }



  addComment(comment: AddCommentRequest): Observable<BlogPostComment> {
    const token = localStorage.getItem('token');
const headers = new HttpHeaders({
  Authorization: `Bearer ${token}`
});
return this.httpClient.post<BlogPostComment>(
  `${environment.apiBaseUrl}/api/comment`, 
  comment, 
  { headers });
}

}
