import { Component } from '@angular/core';
import { LoginRequest } from '../models/login-request-model';
import { AuthService } from '../services/auth.service';
import { CookieService } from 'ngx-cookie-service';
import {  Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {

  model: LoginRequest;
  message: string = '';
  success: boolean = true;
  

  constructor(private authService : AuthService, private cookieService: CookieService,
    private router: Router, private toastr:ToastrService){
    this.model = {
      userName: '',
      email : '',
      password: ''
    };
  }
  onSubmit(): void{
      this.authService.login(this.model).subscribe({
        next:(response) => {
          //set auth cookie
          this.cookieService.set('Authorization', `Bearer ${response.token}`,undefined,
            '/', undefined, true, 'Strict'
          );
          //set user
          this.authService.setUser({
            userName:response.userName,
            email: response.email,
            roles: response.roles
          });
      
          this.router.navigateByUrl('/')
          
        },
        error: (error) => {
          this.success = false;
          if (error.status === 400 || error.status === 401) {
            this.toastr.error('Usuário ou senha incorretos.');
          } else {
            this.toastr.error('Erro inesperado. Tente novamente mais tarde.');
          }
        }

      })
  }




}
