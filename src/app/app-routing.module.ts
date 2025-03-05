import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CategoriesListComponent } from './Features/Categories/categories-list/categories-list.component';
import { AddCategoryComponent } from './Features/Categories/add-category/add-category.component';
import { EditCategoryComponent } from './Features/Categories/edit-category/edit-category.component';
import { BlogpostListComponent } from './Features/blog-post/blogpost-list/blogpost-list.component';
import { AddBlogpostComponent } from './Features/blog-post/add-blogpost/add-blogpost.component';

const routes: Routes = [
  {path: 'admin/categories', component:CategoriesListComponent},
  {path:'admin/categories/add', component:AddCategoryComponent },
  {path: 'admin/categories/:id', component:EditCategoryComponent},
  {path: 'admin/blogpost', component: BlogpostListComponent},
  {path: 'admin/blogpost/add', component:AddBlogpostComponent}

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
