import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { AuthService } from '../services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  registerForm!: FormGroup;
  success: boolean = false;
  message: string = '';
  passwordFocused = false;
  userNameExists: boolean = false;


  criteriaList = [
    { key: 'hasUpperCase', label: 'Pelo menos uma letra maiúscula', valid: false, loading: false },
    { key: 'hasNumber', label: 'Pelo menos um número', valid: false, loading: false },
    { key: 'hasSymbol', label: 'Pelo menos um símbolo (!@#$...)', valid: false, loading: false },
    { key: 'hasMinLength', label: 'Mínimo de 6 caracteres', valid: false, loading: false }
  ];
  constructor(
    private fb: FormBuilder,
    private authService: AuthService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.registerForm = this.fb.group({
      userName: ['', [Validators.required, Validators.minLength(3)]],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [
        Validators.required,
        Validators.minLength(6),
        Validators.pattern(/^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])/)
      ]],
      fullName: [''],
      bio: [''],
      photoUrl: ['', [Validators.pattern(/https?:\/\/.+\.(jpg|jpeg|png)/)]]
    });
    this.registerForm.get('userName')?.valueChanges.subscribe(() => {
      this.userNameExists = false;
    });
    
  }

  onRegister(): void {
    if (this.registerForm.invalid) {
      this.registerForm.markAllAsTouched();
      return;
    }

    this.authService.register(this.registerForm.value).subscribe({
      next: () => {
        this.message = 'Registro concluído com sucesso!';
        this.success = true;
        this.router.navigateByUrl('/login');
      },
      error: (error) => {
        this.message = error?.error || 'Erro ao registrar. Verifique os dados.';
        this.success = false;
      
        if (error.status === 400 && error.error === 'Nome de usuário já está em uso.') {
          this.userNameExists = true;
          this.message = 'Esse nome de usuário já está em uso.';
        } else if (error.status === 400 && error.error === 'E-mail já está em uso.') {
          this.message = 'Esse e-mail já está em uso.';
        } else {
          this.message = 'Erro ao registrar. Verifique os dados.';
        }
      
        console.error('Erro detalhado:', error.error);
      }
    });
  }




  validatePassword(password: string): void {
    const validations = {
      hasUpperCase: /[A-Z]/.test(password),
      hasNumber: /\d/.test(password),
      hasSymbol: /[!@#$%^&*(),.?":{}|<>]/.test(password),
      hasMinLength: password.length >= 6
    };
  
    this.criteriaList.forEach((item) => {
      const wasValid = item.valid;
      const isNowValid = validations[item.key as keyof typeof validations];
  
      if (isNowValid && !wasValid) {
        item.loading = true;
        setTimeout(() => {
          item.loading = false;
          item.valid = true;
        }, 400); // animação "loading" antes do ✔
      } else if (!isNowValid) {
        item.valid = false;
        item.loading = false;
      }
    });
  }



  get f() {
    return this.registerForm.controls;
  }
}
