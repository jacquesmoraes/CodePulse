import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavBarComponent } from './Core/Components/nav-bar/nav-bar.component';
import { CategoriesListComponent } from './Features/Categories/categories-list/categories-list.component';
import { AddCategoryComponent } from './Features/Categories/add-category/add-category.component';
import { FormsModule } from '@angular/forms';
import {HttpClientModule} from '@angular/common/http';
import { EditCategoryComponent } from './Features/Categories/edit-category/edit-category.component'

@NgModule({
  declarations: [
    AppComponent,
    NavBarComponent,
    CategoriesListComponent,
    AddCategoryComponent,
    EditCategoryComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
