import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { UserProfile } from './models/user-profile.model';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { UpdateProfile } from './models/update-profile.model';

@Injectable({
  providedIn: 'root'
})
export class UserProfileService {
  private profileSubject = new BehaviorSubject<UserProfile | null>(null);
  profile$ = this.profileSubject.asObservable();
  constructor(private http:HttpClient) { }


  setProfile(profile: UserProfile):void {
    this.profileSubject.next(profile);
  }

  getProfile(): Observable<UserProfile | null> {
    return this.profileSubject.asObservable();
  }
  
  GetMyProfile():Observable<UserProfile>{
    return this.http.get<UserProfile>(`${environment.apiBaseUrl}/api/UserProfile/me`);
  }

  UpdateMyProfile(data: FormData): Observable<UserProfile>{
    return this.http.put<UserProfile>(`${environment.apiBaseUrl}/api/UserProfile/me`, data)
  }

  GetPublicProfile(username: string): Observable<UserProfile> {
    return this.http.get<UserProfile>(`${environment.apiBaseUrl}/api/UserProfile/public/${username}`);

  }

  getFullImageUrl(imagePath?: string): string {
    return imagePath
      ? `${environment.apiBaseUrl}/${imagePath}`
      : 'assets/default-avatar.png';
  }
  
  


}
