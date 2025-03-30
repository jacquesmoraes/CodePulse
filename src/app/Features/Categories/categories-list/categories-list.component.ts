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
export class CategoriesListComponent implements OnInit {

  categories$?: Observable<Category[]>;
  totalCount?: number;

  // Filtros e paginação
  query?: string;
  sortBy?: string;
  sortDirection?: string;
  pageNumber = 1;
  pageSize = 5;

  // Navegação de páginas
  totalPagesList: number[] = [];

  constructor(
    private categoryService: CategoryService,
    
  ) {}

  ngOnInit(): void {
    this.refreshCategoryList();
  }

  // Carrega total e categorias
  refreshCategoryList(): void {
    this.categoryService.getCategoryCount().subscribe({
      next: (count) => {
        this.totalCount = count;
        const totalPages = Math.ceil(count / this.pageSize);
        this.totalPagesList = Array.from({ length: totalPages }, (_, i) => i + 1);
        this.loadCategories();
      }
    });
  }

  // Requisição centralizada
  private loadCategories(): void {
    this.categories$ = this.categoryService.getAllCategories(
      this.query,
      this.sortBy,
      this.sortDirection,
      this.pageNumber,
      this.pageSize
    );
  }

  onDelete(id: string): void {
    Swal.fire({
      title: "Are you sure?",
      text: "This action cannot be undone!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#d33",
      cancelButtonColor: "#3085d6",
      confirmButtonText: "Yes, delete!",
      cancelButtonText: "Cancel"
    }).then((result) => {
      if (result.isConfirmed) {
        this.categoryService.deleteCategory(id).subscribe({
          next: () => {
            Swal.fire("Deleted!", "Category removed.", "success");
            this.refreshCategoryList();
          },
          error: (err) => {
            console.error("Error deleting category:", err);
            Swal.fire("Error!", "A problem occurred while deleting the category.", "error");
          }
        });
      }
    });
  }

  onSearch(query: string): void {
    this.query = query;
    this.pageNumber = 1;
    this.loadCategories();
  }

  sort(sortBy: string, sortDirection: string): void {
    this.sortBy = sortBy;
    this.sortDirection = sortDirection;
    this.pageNumber = 1;
    this.loadCategories();
  }

  getPage(pageNumber: number): void {
    this.pageNumber = pageNumber;
    this.loadCategories();
  }

  nextPage(): void {
    if (this.pageNumber < this.totalPagesList.length) {
      this.pageNumber++;
      this.loadCategories();
    }
  }

  previousPage(): void {
    if (this.pageNumber > 1) {
      this.pageNumber--;
      this.loadCategories();
    }
  }
}
