import { Component, OnInit } from '@angular/core';
import { AddBlogPost } from '../models/add-blog-post.model';
import { BlogPostService } from '../services/blog-post.service';
import { Router } from '@angular/router';
import { CategoryService } from '../../Categories/services/category.service';
import { Observable } from 'rxjs';
import { Category } from '../../Categories/models/category.model';

@Component({
  selector: 'app-add-blogpost',
  templateUrl: './add-blogpost.component.html',
  styleUrls: ['./add-blogpost.component.css']
})
export class AddBlogpostComponent implements OnInit {
  model:AddBlogPost;
  category$? : Observable<Category[]>;


  constructor(private blogPostService : BlogPostService, private router: Router, private categoryService: CategoryService){
    this.model={
      title :'',
      shortDescription:'',
      urlHandle:'',
      content:'',
      featuredImageUrl:'',
      author:'',
      isVisible:true,
      publishedDate: new Date(),
      categories: []

    }
  }
  ngOnInit(): void {
    this.category$ = this.categoryService.getAllCategories();
  }

  onSubmit():void{
    console.log(this.model)
    this.blogPostService.createBlogPost(this.model).subscribe({
      next : (response) =>{
        this.router.navigateByUrl('/admin/blogpost');
      }
    })
}



}
