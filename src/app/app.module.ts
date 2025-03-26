import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavBarComponent } from './Core/Components/nav-bar/nav-bar.component';
import { CategoriesListComponent } from './Features/Categories/categories-list/categories-list.component';
import { AddCategoryComponent } from './Features/Categories/add-category/add-category.component';
import { FormsModule } from '@angular/forms';
import {HttpClientModule} from '@angular/common/http';
import { EditCategoryComponent } from './Features/Categories/edit-category/edit-category.component';
import { BlogpostListComponent } from './Features/blog-post/blogpost-list/blogpost-list.component';
import { AddBlogpostComponent } from './Features/blog-post/add-blogpost/add-blogpost.component';
import { MarkdownModule } from 'ngx-markdown';
import { EditBlogPostComponent } from './Features/blog-post/edit-blog-post/edit-blog-post.component';
import { ImageSelectorComponent } from './shared/components/image-selector/image-selector.component';
import { BlogPostDetailsComponent } from './Features/blog-post/details-blogpost/details-blogpost.component';
import { FooterComponent } from './Core/Components/footer/footer.component';
import { HomeComponent } from './Features/public/home/home.component';
import { BlogdetailsComponent } from './Features/public/blogdetails/blogdetails.component';
import { LoginComponent } from './Features/auth/login/login.component';


@NgModule({
  declarations: [
    AppComponent,
    NavBarComponent,
    CategoriesListComponent,
    AddCategoryComponent,
    EditCategoryComponent,
    BlogpostListComponent,
    AddBlogpostComponent,
    EditBlogPostComponent,
    ImageSelectorComponent,
    BlogPostDetailsComponent,
    FooterComponent,
    HomeComponent,
    BlogdetailsComponent,
    LoginComponent
    
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    MarkdownModule.forRoot()
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
