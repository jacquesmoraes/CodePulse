import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { AdminUserService } from '../admin-user.service';
@Component({
  selector: 'app-admin-user-create',
  templateUrl: './admin-user-create.component.html',
})
export class AdminUserCreateComponent {
  createUserForm: FormGroup;
  successMessage = '';
  errorMessage = '';

  constructor(private fb: FormBuilder, private adminUserService: AdminUserService) {
    this.createUserForm = this.fb.group({
      fullName: ['', Validators.required],
      userName: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      bio: [''],
      password: ['', Validators.required],
      role: ['Writer', Validators.required], // ou 'User'
    });
  }

  onSubmit() {
    if (this.createUserForm.invalid) return;

    this.adminUserService.createWriter(this.createUserForm.value).subscribe({
      next: (res) => {
        this.successMessage = 'Usuário criado com sucesso!';
        this.errorMessage = '';
        this.createUserForm.reset({ role: 'Writer' });
      },
      error: (err) => {
        this.errorMessage = err.error || 'Erro ao criar usuário.';
        this.successMessage = '';
      },
    });
  }
}
