import { Component } from '@angular/core';
import { UserProfile } from 'src/app/profile/models/user-profile.model';
import { AdminUserService } from '../admin-user.service';

@Component({
  selector: 'app-admin-user-list',
  templateUrl: './admin-user-list.component.html',
  styleUrls: ['./admin-user-list.component.css']
})
export class AdminUserListComponent {
  users: UserProfile[] = [];

  constructor(private adminUserService: AdminUserService) {}

  ngOnInit(): void {
    this.loadUsers();
  }

  loadUsers() {
    this.adminUserService.getAllWriters().subscribe({
      next: (response) => {
        this.users = response;
      },
      error: (err) => {
        console.error('Erro ao buscar usuários:', err);
      },
    });
  }
}
