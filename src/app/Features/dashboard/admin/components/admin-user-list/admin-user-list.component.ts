import { Component, OnInit } from '@angular/core';
import { UserProfile } from 'src/app/profile/user-profile/shared/models/user-profile.model';

import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { AdminUserService } from '../../services/admin-user.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-admin-user-list',
  templateUrl: './admin-user-list.component.html',
  styleUrls: ['./admin-user-list.component.css']
})
export class AdminUserListComponent implements OnInit {
  users: UserProfile[] = [];
  filteredUsers: UserProfile[] = [];
  searchTerm: string = '';

  constructor(
    private adminUserService: AdminUserService,
    private router: Router,
    private toastr: ToastrService
  ) {}

  ngOnInit(): void {
    this.loadUsers();
  }

  loadUsers(): void {
    this.adminUserService.getAllUsers().subscribe({
      next: (response) => {
        this.users = response;
        this.filteredUsers = [...response]; // inicializa lista filtrada
      },
      error: (err) => {
        console.error('Erro ao buscar usuários:', err);
      }
    });
  }

  filterUsers(): void {
    const term = this.searchTerm.toLowerCase();
    this.filteredUsers = this.users.filter(user =>
      user.fullName.toLowerCase().includes(term) ||
      user.userName.toLowerCase().includes(term) ||
      user.email.toLowerCase().includes(term)
    );
  }

  viewProfile(userName: string): void {
    this.router.navigate(['/profile', userName]);
  }

  onRoleChange(user: UserProfile): void {
    Swal.fire({
      title: 'Alterar papel?',
      text: `Tem certeza que deseja definir como "${user.role}"?`,
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Sim, alterar',
      cancelButtonText: 'Cancelar'
    }).then((result) => {
      if (result.isConfirmed) {
        this.adminUserService.updateUserRole(user.id, user.role).subscribe({
          next: () => {
            this.toastr.success('Papel atualizado com sucesso!');
          },
          error: () => {
            this.toastr.error('Erro ao atualizar o papel.');
          }
        });
      }
    });
  }




  deleteUser(userId: string): void {
    Swal.fire({
      title: 'Tem certeza?',
      text: 'Essa ação não pode ser desfeita!',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#d33',
      cancelButtonColor: '#6c757d',
      confirmButtonText: 'Sim, excluir!',
      cancelButtonText: 'Cancelar'
    }).then((result) => {
      if (result.isConfirmed) {
        this.adminUserService.deleteUser(userId).subscribe({
          next: () => {
            this.users = this.users.filter(user => user.id !== userId);
            this.filterUsers(); // atualiza filtrados também
            Swal.fire('Excluído!', 'Usuário removido com sucesso.', 'success');
          },
          error: () => {
            Swal.fire('Erro', 'Erro ao excluir o usuário.', 'error');
          }
        });
      }
    });
  }
}
