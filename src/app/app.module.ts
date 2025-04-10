import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavBarComponent } from './Core/Components/nav-bar/nav-bar.component';
import { CategoriesListComponent } from './Features/Categories/categories-list/categories-list.component';
import { AddCategoryComponent } from './Features/Categories/add-category/add-category.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import {HTTP_INTERCEPTORS, HttpClientModule} from '@angular/common/http';
import { EditCategoryComponent } from './Features/Categories/edit-category/edit-category.component';
import { BlogpostListComponent } from './Features/blog-post/blogpost-list/blogpost-list.component';
import { AddBlogpostComponent } from './Features/blog-post/add-blogpost/add-blogpost.component';

import { EditBlogPostComponent } from './Features/blog-post/edit-blog-post/edit-blog-post.component';
import { ImageSelectorComponent } from './shared/components/image-selector/image-selector.component';
import { BlogPostDetailsComponent } from './Features/blog-post/details-blogpost/details-blogpost.component';
import { FooterComponent } from './Core/Components/footer/footer.component';
import { HomeComponent } from './Features/public/home/home.component';
import { BlogdetailsComponent } from './Features/public/blogdetails/blogdetails.component';
import { LoginComponent } from './Features/auth/login/login.component';
import { AuthInterceptor } from './Core/interceptors/auth.interceptor';
import { RegisterComponent } from './Features/auth/register/register.component';
import { LoadingInterceptor } from './interceptors/loading.interceptor';
import { NgxSpinner, NgxSpinnerModule } from 'ngx-spinner';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ToastrModule } from 'ngx-toastr';
import { LazyLoadDirective } from './shared/directives/lazy-load.directive';
import { UserProfileComponent } from './profile/user-profile/user-profile.component';
import { SidebarComponent } from './Features/public/sidebar/sidebar.component';
import { ProfileCardComponent } from './Features/dashboard/components/profile-card/profile-card.component';
import { ProfileListComponent } from './Features/dashboard/components/profile-list/profile-list.component';
import { DashboardComponent } from './Features/dashboard/writer/dashboard.component';
import { WriterSidebarComponent } from './Features/dashboard/writer/writer-sidebar/writer-sidebar.component';
import { WriterPostsComponent } from './Features/dashboard/writer/writer-posts/writer-posts.component';
import { WriterPostsListComponent } from './Features/dashboard/writer/writer-posts-list/writer-posts-list.component';
import { NgApexchartsModule } from 'ng-apexcharts';
import { MarkdownModule } from 'ngx-markdown';
import { WriterProfileComponent } from './Features/dashboard/writer/writer-profile/writer-profile.component';



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
    LoginComponent,
    RegisterComponent,
    LazyLoadDirective,
    UserProfileComponent,
    SidebarComponent,
    ProfileCardComponent,
    ProfileListComponent,
    DashboardComponent,
    WriterSidebarComponent,
    WriterPostsComponent,
    WriterPostsListComponent,
    WriterProfileComponent,
    UserProfileComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    MarkdownModule.forRoot(),
    NgApexchartsModule,
    NgxSpinnerModule,
    BrowserAnimationsModule,
    ReactiveFormsModule,
    ToastrModule.forRoot({
      positionClass: 'toast-top-center', 
      preventDuplicates: true,
      closeButton: true,
      timeOut: 4000
    }),
  ],
  exports:[

  ],
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: AuthInterceptor,
      multi: true
    },
    {
      provide: HTTP_INTERCEPTORS,
      useClass: LoadingInterceptor,
      multi: true
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
