import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { UserProfile } from 'src/app/profile/user-profile/shared/models/user-profile.model';
import { UserProfileService } from 'src/app/profile/user-profile.service';
import { Router } from '@angular/router';
import { BlogPost } from 'src/app/Features/blog-post/models/blog-post.model';
import { BlogPostService } from 'src/app/Features/blog-post/services/blog-post.service';

@Component({
  selector: 'app-writer-dashboard',
  templateUrl: './writer-dashboard.component.html',
  styleUrls: ['./writer-dashboard.component.css']
})
export class WriterDashboardComponent implements OnInit {
  profile?: UserProfile;
  blogPosts: BlogPost[] = [];
  loading = true;
  displayImageUrl: string = '';
  selectedSection: string = 'posts';
  selectedImageFile: File | null = null;

  isAdmin: boolean = false;
  constructor(
    private userProfileService: UserProfileService,
    private blogPostService: BlogPostService,
    private toastr: ToastrService,
    
  ) {}

  ngOnInit(): void {
    this.loadProfileAndPosts();
  }

  private loadProfileAndPosts(): void {
    this.userProfileService.GetMyProfile().subscribe({
      next: (profile) => {
        this.profile = profile;
        this.displayImageUrl =this.userProfileService.getFullImageUrl(profile.imageUrl);

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

  onSectionChange(section: string) {
    this.selectedSection = section;
  }
  onFileSelected(event: any): void {
    const file = event.target.files[0];
    if (!file) return;
  
    if (!file.type.match(/image\/*/)) {
      this.toastr.error('Por favor, selecione um arquivo de imagem válido.');
      return;
    }
  
    if (file.size > 5 * 1024 * 1024) {
      this.toastr.error('A imagem deve ter no máximo 5MB.');
      return;
    }
  
    this.selectedImageFile = file;
    this.uploadProfileImage();
  }
  
  uploadProfileImage(): void {
    if (!this.selectedImageFile) return;
  
    const formData = new FormData();
    formData.append('fullName', this.profile?.fullName || '');
    formData.append('userName', this.profile?.userName || '');
    formData.append('bio', this.profile?.bio || '');
    formData.append('imageFile', this.selectedImageFile);
  
    this.userProfileService.UpdateMyProfile(formData).subscribe({
      next: (updatedProfile) => {
        this.toastr.success('Imagem de perfil atualizada!');
        this.profile = updatedProfile;
        this.displayImageUrl = this.userProfileService.getFullImageUrl(updatedProfile.imageUrl);
        this.selectedImageFile = null;
        this.userProfileService.setProfile(updatedProfile);
      },
      error: () => {
        this.toastr.error('Erro ao atualizar imagem do perfil.');
      }
    });
  }
  
 


}




