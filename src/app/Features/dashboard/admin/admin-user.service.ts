import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { UserProfile } from 'src/app/profile/models/user-profile.model';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class AdminUserService {
  constructor(private http: HttpClient) {}

  getAllWriters(): Observable<UserProfile[]> {
    return this.http.get<UserProfile[]>(`${environment.apiBaseUrl}/api/UserManagement/writers`);
  }

  getWriterById(id: string): Observable<UserProfile> {
    return this.http.get<UserProfile>(`${environment.apiBaseUrl}/api/UserManagement/writers/${id}`);
  }

  createWriter(user: {
    fullName: string;
    userName: string;
    email: string;
    bio: string;
    password: string;
    role: string;
  }): Observable<UserProfile> {
    return this.http.post<UserProfile>(`${environment.apiBaseUrl}/api/UserManagement/writers`, user);
  }

  updateUserRole(userId: string, newRole: string): Observable<UserProfile> {
    return this.http.put<UserProfile>(
      `${environment.apiBaseUrl}/api/UserManagement/writers/${userId}/role`,
      { newRole }
    );
  }

  deleteWriter(userId: string): Observable<UserProfile> {
    return this.http.delete<UserProfile>(`${environment.apiBaseUrl}/api/UserManagement/writers/${userId}`);
  }
}