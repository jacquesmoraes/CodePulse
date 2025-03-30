import { Component } from '@angular/core';
import { RegisterRequest } from '../models/register-request-model';
import { AuthService } from '../services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent {

  userName:string = '';
  email: string = '';
  password: string = '';
  message: string = '';
  success: boolean = false;

  constructor(private authService: AuthService, private router: Router) {

  }

  onRegister(): void {

    const request: RegisterRequest = {
      userName:this.userName,
      email: this.email,
      password: this.password
    };

    this.authService.register(request).subscribe({
      next: () => {
        this.message = 'Registro concluído com sucesso!';
        this.success = true;

        this.router.navigateByUrl('/login');
      },
      error: (error) => {
        this.message = 'Erro ao registrar. Verifique os dados.';
        this.success = false;
        console.error(error);
      }
    });

  }


}
