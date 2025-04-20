import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

import Swal from 'sweetalert2';
import { CreateUserRequest } from '../../models/create-user.model';
import { AdminUserService } from '../../services/admin-user.service';
@Component({
  selector: 'app-admin-user-create',
  templateUrl: './admin-user-create.component.html',
  styleUrls: ['./admin-user-create.component.css']
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
      role: ['User', Validators.required], // valor padrão atualizado para 'User'
    });
    
  }

  onSubmit() {
    if (this.createUserForm.invalid) return;
  
    const formValue = this.createUserForm.value;
  
    console.log('🛫 Payload enviado:', formValue);
  
    const userPayload: CreateUserRequest = { ...formValue };
  
    this.adminUserService.createUser(userPayload).subscribe({
      next: () => {
        Swal.fire('Sucesso', 'Usuário criado com sucesso!', 'success');
        this.createUserForm.reset({ role: 'User' });
      },
      error: (err) => {
        Swal.fire('Erro', err.error || 'Erro ao criar usuário.', 'error');
      },
    });
  }
  

}
