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


const routes: Routes = [
  {path: 'admin/categories', component:CategoriesListComponent, canActivate:[authGuard]},
  {path:'admin/categories/add', component:AddCategoryComponent , canActivate:[authGuard]},
  {path: 'admin/categories/:id', component:EditCategoryComponent, canActivate:[authGuard]},
  {path: 'admin/blogpost', component: BlogpostListComponent, canActivate:[authGuard]},
  {path: 'admin/blogpost/add', component:AddBlogpostComponent, canActivate:[authGuard]},
  {path: 'admin/blogpost/:id', component:EditBlogPostComponent, canActivate:[authGuard]},
  {path: 'admin/blogpost/details/:id', component:BlogPostDetailsComponent, canActivate:[authGuard]},
  {path: '', component:HomeComponent},
  {path: 'blog/:url', component:BlogdetailsComponent},
  {path: 'login', component:LoginComponent}

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
