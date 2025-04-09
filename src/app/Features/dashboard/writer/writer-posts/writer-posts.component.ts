// writer-posts.component.ts
import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-writer-posts',
  templateUrl: './writer-posts.component.html',
})
export class WriterPostsComponent {
  totalPosts = 12;

  topViewedPosts = [
    { title: 'Postagem A', views: 120 },
    { title: 'Postagem B com título longo', views: 90 },
    { title: 'Postagem C', views: 75 },
  ];

  constructor(private router: Router) {}

  addPost() {
    this.router.navigate(['/dashboard/create']);
  }

  goToPosts() {
    this.router.navigate(['/dashboard/posts']);
  }
}
