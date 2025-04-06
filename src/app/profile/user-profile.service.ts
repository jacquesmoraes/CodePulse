import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { UserProfile } from './models/user-profile.model';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { UpdateProfile } from './models/update-profile.model';

@Injectable({
  providedIn: 'root'
})
export class UserProfileService {

  constructor(private http:HttpClient) { }


  GetMyProfile():Observable<UserProfile>{
    return this.http.get<UserProfile>(`${environment.apiBaseUrl}/api/UserProfile/me`);
  }

  UpdateMyProfile(data: FormData): Observable<UserProfile>{
    return this.http.put<UserProfile>(`${environment.apiBaseUrl}/api/UserProfile/me`, data)
  }


}
