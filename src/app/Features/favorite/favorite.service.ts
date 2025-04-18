import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { catchError, Observable, tap, throwError } from 'rxjs';
import { FavoritePost } from './favorite-post.model';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class FavoriteService {

  private baseUrl =`${environment.apiBaseUrl}/api/favorites`;
  constructor(private http: HttpClient) { }


  getMyFavorites(): Observable<FavoritePost[]>{
return this.http.get<FavoritePost[]>(this.baseUrl);
  }
  getFavoritesByUserId(userId: string): Observable<FavoritePost[]> {
    return this.http.get<FavoritePost[]>(`${this.baseUrl}/user/${userId}`);
  }
  

  isFavorite(postId: string): Observable<boolean> {
    return this.http.get<boolean>(`${this.baseUrl}/isFavorite/${postId}`);
  }
  

  addFavorite(postId:string): Observable<FavoritePost>{
    return this.http.post<FavoritePost>(`${this.baseUrl}/${postId}`, {});
  }

  removeFavorite(postId: string): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/${postId}`);
  }
  
}
