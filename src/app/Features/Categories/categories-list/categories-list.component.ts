import { Component, OnInit } from '@angular/core';
import { CategoryService } from '../services/category.service';
import { Category } from '../models/category.model';
import { Observable } from 'rxjs';
import { Route } from '@angular/router';

@Component({
  selector: 'app-categories-list',
  templateUrl: './categories-list.component.html',
  styleUrls: ['./categories-list.component.css']
})
export class CategoriesListComponent  implements OnInit {

  categories$?: Observable<Category[]>
  id:string | null = null

  constructor(private categoryService: CategoryService){

  }
  ngOnInit(): void {
    this.categories$ = this.categoryService.getAllCategories()
    
  }
  
 

}
