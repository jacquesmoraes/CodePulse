import { Component, OnInit } from '@angular/core';
import { CategoryService } from '../services/category.service';
import { Category } from '../models/category.model';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';


@Component({
  selector: 'app-categories-list',
  templateUrl: './categories-list.component.html',
  styleUrls: ['./categories-list.component.css']
})
export class CategoriesListComponent  implements OnInit {

  categories$?: Observable<Category[]>
  id:string | null = null

  constructor(private categoryService: CategoryService, private router: Router){

  }
  ngOnInit(): void {
    this.categories$ = this.categoryService.getAllCategories();
    
  }
  
  onDelete(id: string): void {
    Swal.fire({
      title: "Are you sure?",
      text: "this action cannot be undone!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#d33",
      cancelButtonColor: "#3085d6",
      confirmButtonText: "yes, delete!",
      cancelButtonText: "Cancel"
    }).then((result) => {
      if (result.isConfirmed) {
        this.categoryService.deleteCategory(id).subscribe({
          next: () => {
            Swal.fire("Deleted!", "category removed.", "success");
            this.categories$ = this.categoryService.getAllCategories();
          },
          error: (err) => {
            console.error("error ecluding category:", err);
            Swal.fire("Erro!", "a problem occured when deleting category.", "error");
          }
        });
      }
    });
  }
  

  onSearch(query: string){
    this.categories$ = this.categoryService.getAllCategories(query);

  }

}
