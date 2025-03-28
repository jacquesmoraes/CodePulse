import { Injectable } from '@angular/core';
import { AddCategoryRequest } from '../models/add-category-request.model';
import { BehaviorSubject, Observable, tap } from 'rxjs';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Category } from '../models/category.model';
import { environment } from 'src/environments/environment';
import { UpdatecategoryRequest } from '../models/update-category-request.model';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {

  private categorySubject = new BehaviorSubject<Category[]>([]);
  public categories$ = this.categorySubject.asObservable();

  constructor(private http:HttpClient) { }



  loadAllCategories(): void {
    this.http
      .get<Category[]>(`${environment.apiBaseUrl}/api/categories`)
      .subscribe(categories => {
        console.log('Categorias atualizadas:', categories);
        this.categorySubject.next(categories);
      });
  }

getAllCategories(query?: string): Observable<Category[]>{
  let params = new HttpParams();
  if(query){
    params = params.set('query', query)
  }

  return this.http.get<Category[]>(`${environment.apiBaseUrl}/api/categories`,{
    params:params
  });
}

getCategoryById(id: string): Observable<Category>{
  return this.http.get<Category>(`${environment.apiBaseUrl}/api/categories/${id}`)
}

addCategory(model:AddCategoryRequest): Observable<void> {
  return this.http.post<void>(`${environment.apiBaseUrl}/api/categories?addAuth=true`, model).pipe(
    tap(() => this.loadAllCategories())
  );
}

UpdateCategory(id: string, updateCategoryRequest : UpdatecategoryRequest): Observable<Category>{
return this.http.put<Category>(`${environment.apiBaseUrl}/api/categories/${id}?addAuth=true`, updateCategoryRequest).pipe(
  tap(() => this.loadAllCategories())
);
}

deleteCategory(id:string):Observable<Category>{
  return this.http.delete<Category>(`${environment.apiBaseUrl}/api/categories/${id}?addAuth=true`).pipe(
    tap(() => this.loadAllCategories())
  );
}

}
