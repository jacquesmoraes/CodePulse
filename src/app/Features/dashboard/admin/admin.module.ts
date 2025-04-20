import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AdminUserDashboardComponent } from './components/admin-user-dashboard.component';
import { AdminUserListComponent } from './components/admin-user-list/admin-user-list.component';
import { AdminUserCreateComponent } from './components/admin-user-create/admin-user-create.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AdminRoutingModule } from './admin-routing.module';
import { SharedModule } from '../shared/shared.module';
import { WriterModule } from '../writer/writer.module';



@NgModule({
  declarations: [
    AdminUserDashboardComponent,
    AdminUserListComponent,
    AdminUserCreateComponent
  ],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    FormsModule,
    AdminRoutingModule,
    SharedModule,
    WriterModule
  ],
  exports: [    
    AdminUserDashboardComponent,
    AdminUserListComponent
  ]
})
export class AdminModule { }
