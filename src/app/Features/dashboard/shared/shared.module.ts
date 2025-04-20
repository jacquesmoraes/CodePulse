import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { UserProfileCardComponent } from './components/user-profile-card/user-profile-card.component';
import { UserProfileListComponent } from './components/user-profile-list/user-profile-list.component';
import { RouterModule } from '@angular/router';



@NgModule({
  declarations: [
    UserProfileCardComponent,
    UserProfileListComponent
  ],
  imports: [
    CommonModule,
    RouterModule
  ],
  exports:[
    UserProfileCardComponent,
    UserProfileListComponent
  ]
})
export class SharedModule { }
