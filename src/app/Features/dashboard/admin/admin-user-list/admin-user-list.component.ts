import { Component, OnInit } from '@angular/core';
import { UserProfile } from 'src/app/profile/models/user-profile.model';
import { AdminUserService } from '../admin-user.service';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';

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
    private router: Router
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
