import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FavoritesSectionComponent } from './components/favorites-section/favorites-section.component';
import { ProfileDetailsComponent } from './components/profile-details/profile-details.component';
import { ProfileEditFormComponent } from './components/profile-edit-form/profile-edit-form.component';
import { ProfileHeaderComponent } from './components/profile-header/profile-header.component';
import { UserProfileComponent } from './user-profile.component';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { WriterProfileSectionComponent } from './components/writer-profile-section/writer-profile-section.component';
import { RouterModule } from '@angular/router';



@NgModule({
  declarations: [
    ProfileHeaderComponent,
    ProfileEditFormComponent,
    ProfileDetailsComponent,
    FavoritesSectionComponent,
    WriterProfileSectionComponent,
    UserProfileComponent
  ],
  imports: [
    CommonModule,
    ReactiveFormsModule,
    FormsModule,
    RouterModule 
  ],
  exports:[
    ProfileHeaderComponent,
    ProfileEditFormComponent,
    ProfileDetailsComponent,
    FavoritesSectionComponent,
    WriterProfileSectionComponent,
    UserProfileComponent 
  ]
})
export class UserProfileModule { }
