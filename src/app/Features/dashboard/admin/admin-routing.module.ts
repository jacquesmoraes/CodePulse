import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { adminGuard } from '../../auth/guards/admin.guard';
import { AdminUserCreateComponent } from './components/admin-user-create/admin-user-create.component';
import { AdminUserDashboardComponent } from './components/admin-user-dashboard.component';
import { AdminUserListComponent } from './components/admin-user-list/admin-user-list.component';


const routes: Routes = [
  {
    path: 'admin',
    children: [
      { path: 'dashboard', component: AdminUserDashboardComponent },
      { path: 'users', component: AdminUserListComponent },
      { path: 'users/create', component: AdminUserCreateComponent }
    ],
    canActivate: [adminGuard]
  }
];
@NgModule({
 
  imports: [
    RouterModule.forChild(routes)
  ],
  exports:[RouterModule]
})
export class AdminRoutingModule { }
