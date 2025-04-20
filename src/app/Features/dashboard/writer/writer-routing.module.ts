import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { EditBlogPostComponent } from '../../blog-post/edit-blog-post/edit-blog-post.component';
import { BlogPostDetailsComponent } from '../../blog-post/details-blogpost/details-blogpost.component';
import { WriterDashboardComponent } from './components/writer-dashboard.component';
import { RouterModule, Routes } from '@angular/router';
import { WriterProfileComponent } from './components/writer-profile/writer-profile.component';
import { AddBlogpostComponent } from '../../blog-post/add-blogpost/add-blogpost.component';
import { authGuard } from '../../auth/guards/auth.guard';

const routes: Routes = [
  {
    path: 'dashboard',
    children: [
  { path: '', component: WriterDashboardComponent },
  { path: 'edit/:id', component: EditBlogPostComponent },
  { path: 'details/:id', component: BlogPostDetailsComponent },
  {path: 'add', component: AddBlogpostComponent},
  {path: 'updateprofile', component: WriterProfileComponent}
],
canActivate: [authGuard]
}
];
@NgModule({
  declarations: [],
  imports: [
    RouterModule.forChild(routes)
  ],
  exports:[RouterModule]
})
export class WriterRoutingModule { }
