import { Component } from '@angular/core';
import { LoginRequest } from '../models/login-request-model';
import { AuthService } from '../services/auth.service';
import { CookieService } from 'ngx-cookie-service';
import {  Router } from '@angular/router';
import { User } from '../models/user.model';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {

  model: LoginRequest;


  constructor(private authService : AuthService, private cookieService: CookieService,
    private router: Router){
    this.model = {
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
            email: response.email,
            roles: response.roles
          });

          //redirect back home
          this.router.navigateByUrl('/')
          
        }

      })
  }




}
