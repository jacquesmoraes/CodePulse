import { Component } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { UserProfile } from 'src/app/profile/models/user-profile.model';
import { UserProfileService } from 'src/app/profile/user-profile.service';
import { BlogPost } from '../../blog-post/models/blog-post.model';
import { BlogPostService } from '../../blog-post/services/blog-post.service';
import { AdminUserService } from './admin-user.service';

@Component({
  selector: 'app-admin-user-dashboard',
  templateUrl: './admin-user-dashboard.component.html',
  styleUrls: ['./admin-user-dashboard.component.css']
})
export class AdminUserDashboardComponent {
  profile?: UserProfile;
  blogPosts: BlogPost[] = [];
  loading = true;
  displayImageUrl: string = '';
  selectedSection: string = 'posts';
  authors: UserProfile[] = []; 

  constructor(
    private userProfileService: UserProfileService,
    private blogPostService: BlogPostService,
    private adminUserService: AdminUserService,
    private toastr: ToastrService
  ) {}

  ngOnInit(): void {
    this.loadProfileAndPosts();
  }

  private loadProfileAndPosts(): void {
    this.userProfileService.GetMyProfile().subscribe({
      next: (profile) => {
        this.profile = profile;
        this.displayImageUrl = this.userProfileService.getFullImageUrl(profile.imageUrl);

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

    // Usando o AdminUserService em vez do UserProfileService
    this.adminUserService.getAllWriters().subscribe({
      next: (data) => {
        // opcional: filtra o admin fora da lista
        this.authors = data.filter(author => author.userName.toLowerCase() !== 'admin');
      },
      error: (error) => {
        console.error('Erro ao carregar autores:', error);
        this.toastr.error('Erro ao carregar autores');
      }
    });
  }

  onSectionChange(section: string) {
    this.selectedSection = section;
  }
}