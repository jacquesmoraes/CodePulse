import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { UserProfile } from 'src/app/profile/user-profile/shared/models/user-profile.model';
import { environment } from 'src/environments/environment';
import { CreateUserRequest } from './models/create-user.model';

@Injectable({
  providedIn: 'root',
})
export class AdminUserService {
  constructor(private http: HttpClient) {}

  getAllUsers(): Observable<UserProfile[]> {
    return this.http.get<UserProfile[]>(`${environment.apiBaseUrl}/api/UserManagement/users`);
  }
  

  getWriterById(id: string): Observable<UserProfile> {
    return this.http.get<UserProfile>(`${environment.apiBaseUrl}/api/UserManagement/writers/${id}`);
  }

 

createWriter(user: CreateUserRequest): Observable<UserProfile> {
  return this.http.post<UserProfile>(
    `${environment.apiBaseUrl}/api/UserManagement/users`,
    user
  );
}

createUser(user: CreateUserRequest): Observable<UserProfile> {
  // a conversão de 'Reader' para 'User' será feita no componente
  return this.http.post<UserProfile>(
    `${environment.apiBaseUrl}/api/UserManagement/users`,
    user
  );
}

  updateUserRole(userId: string, newRole: string): Observable<UserProfile> {
    return this.http.put<UserProfile>(
      `${environment.apiBaseUrl}/api/UserManagement/writers/${userId}/role`,
      { newRole }
    );
  }
  deleteUser(userId: string): Observable<UserProfile> {
    return this.http.delete<UserProfile>(`${environment.apiBaseUrl}/api/UserManagement/users/${userId}`);
  }
  

  deleteWriter(userId: string): Observable<UserProfile> {
    return this.http.delete<UserProfile>(`${environment.apiBaseUrl}/api/UserManagement/writers/${userId}`);
  }
}