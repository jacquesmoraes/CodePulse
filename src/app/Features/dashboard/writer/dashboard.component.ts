import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { UserProfile } from 'src/app/profile/models/user-profile.model';
import { UserProfileService } from 'src/app/profile/user-profile.service';
import { BlogPost } from '../../blog-post/models/blog-post.model';
import { BlogPostService } from '../../blog-post/services/blog-post.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
  profile?: UserProfile;
  blogPosts: BlogPost[] = [];
  loading = true;
  displayImageUrl: string = '';

  constructor(
    private userProfileService: UserProfileService,
    private blogPostService: BlogPostService,
    private toastr: ToastrService
  ) {}

  ngOnInit(): void {
    this.loadProfileAndPosts();
  }

  private loadProfileAndPosts(): void {
    this.userProfileService.GetMyProfile().subscribe({
      next: (profile) => {
        this.profile = profile;
        this.displayImageUrl = profile.imageUrl
          ? `https://localhost:7167/${profile.imageUrl}`
          : 'assets/default-avatar.png';

        this.blogPostService.getMyPosts().subscribe({
          next: (posts) => {
            this.blogPosts = posts;
            this.loading = false;
          },
          error: () => {
            this.toastr.error('Erro ao carregar posts');
            this.loading = false;
          }
        });
      },
      error: () => {
        this.toastr.error('Erro ao carregar perfil');
        this.loading = false;
      }
    });
  }
}




