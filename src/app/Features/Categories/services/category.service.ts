import { Injectable } from '@angular/core';
import { AddCategoryRequest } from '../models/add-category-request.model';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { Category } from '../models/category.model';
import { environment } from 'src/environments/environment';
import { UpdatecategoryRequest } from '../models/update-category-request.model';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {

  constructor(private http:HttpClient) { }



getAllCategories(): Observable<Category[]>{
  return this.http.get<Category[]>(`${environment.apiBaseUrl}/api/categories`);
}

getCategoryById(id: string): Observable<Category>{
  return this.http.get<Category>(`${environment.apiBaseUrl}/api/categories/${id}`)
}

addCategory(model:AddCategoryRequest): Observable<void> {
  return this.http.post<void>(`${environment.apiBaseUrl}/api/categories?addAuth=true`, model);
}

UpdateCategory(id: string, updateCategoryRequest : UpdatecategoryRequest): Observable<Category>{
return this.http.put<Category>(`${environment.apiBaseUrl}/api/categories/${id}?addAuth=true`, updateCategoryRequest)
}

deleteCategory(id:string):Observable<Category>{
  return this.http.delete<Category>(`${environment.apiBaseUrl}/api/categories/${id}?addAuth=true`)
}

}
