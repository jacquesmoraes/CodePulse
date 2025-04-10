import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CategoriesListComponent } from './Features/Categories/categories-list/categories-list.component';
import { AddCategoryComponent } from './Features/Categories/add-category/add-category.component';
import { EditCategoryComponent } from './Features/Categories/edit-category/edit-category.component';
import { BlogpostListComponent } from './Features/blog-post/blogpost-list/blogpost-list.component';
import { AddBlogpostComponent } from './Features/blog-post/add-blogpost/add-blogpost.component';
import { EditBlogPostComponent } from './Features/blog-post/edit-blog-post/edit-blog-post.component';
import { BlogPostDetailsComponent } from './Features/blog-post/details-blogpost/details-blogpost.component';
import { HomeComponent } from './Features/public/home/home.component';
import { BlogdetailsComponent } from './Features/public/blogdetails/blogdetails.component';
import { LoginComponent } from './Features/auth/login/login.component';
import { authGuard } from './Features/auth/guards/auth.guard';
import { RegisterComponent } from './Features/auth/register/register.component';
import { UserProfileComponent } from './profile/user-profile/user-profile.component';
import { DashboardComponent } from './Features/dashboard/writer/dashboard.component';
import { adminGuard } from './Features/auth/guards/admin.guard';
import { AdminUserDashboardComponent } from './Features/dashboard/admin/admin-user-dashboard.component';
import { AdminUserListComponent } from './Features/dashboard/admin/admin-user-list/admin-user-list.component';
import { AdminUserCreateComponent } from './Features/dashboard/admin/admin-user-create/admin-user-create.component';


const routes: Routes = [
  { path: 'admin/categories', component: CategoriesListComponent, canActivate: [authGuard, adminGuard] },
  { path: 'admin/categories/add', component: AddCategoryComponent, canActivate: [authGuard] },
  { path: 'admin/categories/:id', component: EditCategoryComponent, canActivate: [authGuard] },
  { path: 'admin/blogpost', component: BlogpostListComponent, canActivate: [authGuard] },
  { path: 'admin/blogpost/add', component: AddBlogpostComponent, canActivate: [authGuard] },
  { path: 'admin/blogpost/:id', component: EditBlogPostComponent, canActivate: [authGuard] },
  { path: 'admin/blogpost/details/:id', component: BlogPostDetailsComponent, canActivate: [authGuard] },
  {path: 'admin/dashboard', component: AdminUserDashboardComponent, canActivate:[adminGuard]},
  { path: 'dashboard', component: DashboardComponent, canActivate: [authGuard] },
  { path: 'dashboard/edit/:id', component: EditBlogPostComponent, canActivate: [authGuard] },
  { path: 'dashboard/details/:id', component: BlogPostDetailsComponent, canActivate: [authGuard] },
  {path: 'dashboard/add', component:AddBlogpostComponent, canActivate: [authGuard]},
  { path: '', component: HomeComponent },
  { path: 'blog/:url', component: BlogdetailsComponent },
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'aboutme', component: UserProfileComponent, canActivate: [authGuard] },
  { path: 'profile/:username', component: UserProfileComponent }

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
