import { Injectable } from '@angular/core';
import { LoginRequest } from '../models/login-request-model';
import { BehaviorSubject, Observable, tap } from 'rxjs';
import { loginResponse } from '../models/login-response';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { User } from '../models/user.model';
import { CookieService } from 'ngx-cookie-service';
import { RegisterRequest } from '../models/register-request-model';
import { ForgotPasswordRequest } from '../models/forgot-password-model';
import { ResetPasswordRequest } from '../models/reset-password-model';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private userRole: string = '';
  $user = new BehaviorSubject<User | undefined>(undefined);

  constructor(private http: HttpClient, private cookieService: CookieService) {
    const savedUser = this.getUser();
    if (savedUser) {
      this.$user.next(savedUser);
    }
  }

  getUserRole(): string {
    return this.userRole;
  }

  login(request: LoginRequest): Observable<loginResponse> {
    return this.http.post<loginResponse>(`${environment.apiBaseUrl}/api/auth/login`, {
      email: request.email,
      password: request.password
    }).pipe(
      tap(response => {
        // ✅ Salvar o token no localStorage
        localStorage.setItem('token', response.token);
        this.userRole = response.roles[0];

        // ✅ Setar o user no BehaviorSubject
        this.setUser({
          email: response.email,
          roles: response.roles,
          userName: response.userName
        });
      })
    );
  }

  register(request: RegisterRequest): Observable<void> {
    return this.http.post<void>(`${environment.apiBaseUrl}/api/auth/register`, request);
  }

  setUser(user: User): void {
    this.$user.next(user);
    localStorage.setItem('user-email', user.email);
    localStorage.setItem('user-roles', user.roles.join(','));
    localStorage.setItem('user-name', user.userName);
  }

  user(): Observable<User | undefined> {
    return this.$user.asObservable();
  }

  getUser(): User | undefined {

    const email = localStorage.getItem('user-email');
    const roles = localStorage.getItem('user-roles');
    const userName = localStorage.getItem('user-name');
    if (email && roles && userName) {
      const user: User = {
        email,
        roles: roles.split(','),
        userName
      };
      return user;
    }
    return undefined;
  }

  
  forgotPassword(email: string): Observable<void> {
    const request: ForgotPasswordRequest = {
      email: email,
      clientUrl: `${window.location.origin}/reset-password` // URL base do seu frontend
    };

    return this.http.post<void>(
      `${environment.apiBaseUrl}/api/auth/forgot-password`,
      request
    );
  }

  resetPassword(request: ResetPasswordRequest): Observable<void> {
    return this.http.post<void>(
      `${environment.apiBaseUrl}/api/auth/reset-password`,
      request
    );
  }


  lougout(): void {
    localStorage.clear();
    this.cookieService.delete('Authorization', '/');
    this.$user.next(undefined);
  }

}
