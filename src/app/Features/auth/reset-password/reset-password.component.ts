import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-reset-password',
  templateUrl: './reset-password.component.html',
  styleUrls: ['./reset-password.component.css']
})
export class ResetPasswordComponent implements OnInit{
  resetPasswordForm: FormGroup;
  token: string = '';
  email: string = '';
  submitted = false;
  errorMessage = '';

  constructor(
    private formBuilder: FormBuilder,
    private route: ActivatedRoute,
    private router: Router,
    private authService: AuthService
  ) {
    this.resetPasswordForm = this.formBuilder.group({
      newPassword: ['', [Validators.required, Validators.minLength(6)]],
      confirmPassword: ['', Validators.required]
    }, {
      validator: this.passwordMatchValidator
    });
  }

  ngOnInit(): void {
    // Pegar token e email da URL
    this.route.queryParams.subscribe(params => {
      this.token = params['token'];
      this.email = params['email'];

      if (!this.token || !this.email) {
        this.router.navigateByUrl('/login');
      }
    });
  }



 passwordMatchValidator(g: FormGroup) {
    return g.get('newPassword')?.value === g.get('confirmPassword')?.value
      ? null : { 'mismatch': true };
  }

  onSubmit(): void {
    this.submitted = true;
    this.errorMessage = '';

    if (this.resetPasswordForm.valid) {
      const request = {
        email: this.email,
        token: this.token,
        newPassword: this.resetPasswordForm.get('newPassword')?.value
      };

      this.authService.resetPassword(request).subscribe({
        next: () => {
          this.router.navigateByUrl('/login?resetSuccess=true');
        },
        error: (error) => {
          this.errorMessage = 'Não foi possível redefinir sua senha. O link pode ter expirado.';
          console.error('Erro:', error);
        }
      });
    }
  }




}
