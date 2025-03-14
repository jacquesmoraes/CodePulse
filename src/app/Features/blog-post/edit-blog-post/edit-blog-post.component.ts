import { Component, OnInit } from '@angular/core';
import { BlogPost } from '../models/blog-post.model';
import { ActivatedRoute, Router } from '@angular/router';
import { BlogPostService } from '../services/blog-post.service';
import { Observable, Subscription } from 'rxjs';
import { CategoryService } from '../../Categories/services/category.service';
import { Category } from '../../Categories/models/category.model';
import { UpdateBlogPost } from '../models/update-blog-post.model';

@Component({
  selector: 'app-edit-blog-post',
  templateUrl: './edit-blog-post.component.html',
  styleUrls: ['./edit-blog-post.component.css']
})
export class EditBlogPostComponent implements OnInit{
  id?: string;
  blogPost? : BlogPost;
  private subcription? : Subscription;
  private updateblogpost? : Subscription;
  categories$?: Observable<Category[]>;
  selectedCategories?: string[];
  isImageSelectorVisible : boolean = false;

  constructor(private route:ActivatedRoute, private blogPostService: BlogPostService,
    private categoryService: CategoryService, public router: Router){
  }
  
  
  ngOnInit(): void {
    this.categories$ = this.categoryService.getAllCategories();
    this.id = this.route.snapshot.paramMap.get('id') || '';
    if(this.id) {
      this.subcription =  this.blogPostService.GetBlogPostById(this.id).subscribe({
        next: (response)=> {
          
          this.blogPost = response;
          this.selectedCategories = response.categories.map(x => x.id);
          console.log('Categorias selecionadas:', this.selectedCategories);
        }
      });
    }
  }

  onSubmit():void{
 
if(this.blogPost && this.id){
  
  const updateblogpost : UpdateBlogPost= {
   title: this.blogPost.title,
   shortDescription: this.blogPost.shortDescription,
   content: this.blogPost.content,
      featuredImageUrl: this.blogPost.featuredImageUrl,
      urlHandle: this.blogPost.urlHandle,
      publishedDate: this.blogPost.publishedDate,
      author: this.blogPost.author,
      isVisible: this.blogPost.isVisible,
      categories: this.selectedCategories ?? []
  };
  
  this.updateblogpost = this.blogPostService.updateBlogPost(this.id, updateblogpost).subscribe({
    next: (response) => {
      
      this.router.navigateByUrl('/admin/blogpost');
    }
  })
}
}

  openImageSelector():void{
    this.isImageSelectorVisible = true
  }
  closeImageSelector(): void{
    this.isImageSelectorVisible = false
  }
  ngOnDestroy(): void{
  this.subcription?.unsubscribe();
  this.updateblogpost?.unsubscribe();
}


}
