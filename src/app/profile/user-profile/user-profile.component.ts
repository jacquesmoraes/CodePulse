import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators, AbstractControl } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { UserProfile } from './shared/models/user-profile.model';
import { UserProfileService } from '../user-profile.service';
import { environment } from 'src/environments/environment';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthService } from 'src/app/Features/auth/services/auth.service';
import { FavoriteService } from 'src/app/Features/favorite/favorite.service';
import { BlogPostService } from 'src/app/Features/blog-post/services/blog-post.service';
import { FavoritePost } from 'src/app/Features/favorite/favorite-post.model';

@Component({
  selector: 'app-user-profile',
  templateUrl: './user-profile.component.html',
  styleUrls: ['./user-profile.component.css']
})
export class UserProfileComponent implements OnInit {
  profileForm!: FormGroup;
  profile?: UserProfile;
  isEditing: boolean = false;
  loading: boolean = true;
  selectedImageFile?: File;
  displayImageUrl: string = '';
  baseUrl: string = environment.apiBaseUrl;
  imageJustUpdated: boolean = false;
  userNameExists: boolean = false;
  isOwnProfile: boolean = false;
  profileRole: string = '';

  favoritePosts: FavoritePost[] = [];
  favoritesLoading: boolean = false;
  activeFilter: string = 'all';

  writerPosts: any[] = [];
  writerPostsLoading: boolean = false;

  constructor(
    private fb: FormBuilder,
    private userProfileService: UserProfileService,
    private toastr: ToastrService,
    private route: ActivatedRoute,
    private router: Router,
    private authService: AuthService,
    private favoriteService: FavoriteService,
    private blogPostService: BlogPostService
  ) {}

  ngOnInit(): void {
    const username: string | null = this.route.snapshot.paramMap.get('username');
    if (username) {
      this.loadPublicProfile(username);
    } else {
      this.loadOwnProfile();
    }
  }

  loadFavorites(): void {
    this.favoritesLoading = true;

    if (this.isOwnProfile) {
      this.favoriteService.getMyFavorites().subscribe({
        next: (posts) => {
          this.favoritePosts = posts;
          this.favoritesLoading = false;
        },
        error: () => {
          this.favoritesLoading = false;
          this.favoritePosts = [];
        }
      });
    } else if (this.profile?.id) {
      this.favoriteService.getFavoritesByUserId(this.profile.id).subscribe({
        next: (posts) => {
          this.favoritePosts = posts;
          this.favoritesLoading = false;
        },
        error: () => {
          this.favoritesLoading = false;
          this.favoritePosts = [];
        }
      });
    }
  }

  filterFavorites(filter: string): void {
    this.activeFilter = filter;
    if (filter === 'posts' && this.profile?.id && this.profile.role === 'Writer') {
      // Load writer posts if not already loaded
      if (this.writerPosts.length === 0 && !this.writerPostsLoading) {
        this.loadWriterPosts(this.profile.id);
      }
    }
  }

  removeFavorite(favoriteId: string): void {
    const favorite = this.favoritePosts.find(f => f.id === favoriteId);
    if (!favorite) return;

    this.favoriteService.removeFavorite(favorite.blogPostId).subscribe({
      next: () => {
        this.favoritePosts = this.favoritePosts.filter(f => f.id !== favoriteId);
      },
      error: () => {
        this.toastr.error('Erro ao remover dos favoritos.');
      }
    });
  }

  loadOwnProfile(): void {
    this.loading = true;
    this.isOwnProfile = true;  // Make sure this is set to true
  
    this.userProfileService.GetMyProfile().subscribe({
      next: (profile: UserProfile) => {
        this.profile = profile;
        this.displayImageUrl = this.userProfileService.getFullImageUrl(profile.imageUrl);
        this.loading = false;
        this.loadFavorites();
      },
      error: () => {
        this.toastr.error('Erro ao carregar o perfil.');
        this.loading = false;
      }
    });
  }

  loadPublicProfile(username: string): void {
    this.loading = true;
    this.isOwnProfile = false;
  
    this.userProfileService.GetPublicProfile(username).subscribe({
      next: (profile: UserProfile) => {
       
        this.profile = profile;
        this.displayImageUrl = this.userProfileService.getFullImageUrl(profile.imageUrl);
        this.loading = false;
        this.loadFavorites();
        
        if (profile.role === 'Writer') {
          this.loadWriterPosts(profile.id);
        }
      },
      error: () => {
        this.toastr.error('Erro ao carregar perfil público.');
        this.loading = false;
      }
    });
  }

  loadWriterPosts(writerId: string): void {
    this.writerPostsLoading = true;
    this.blogPostService.getPostsByAuthorId(writerId).subscribe({
      next: (posts) => {
        this.writerPosts = posts;
        this.writerPostsLoading = false;
      },
      error: () => {
        this.writerPostsLoading = false;
      }
    });
  }

  private initProfileForm(profile: UserProfile): void {
    this.profile = profile;

    this.profileForm = this.fb.group({
      fullName: [profile.fullName, [Validators.required, Validators.minLength(3)]],
      userName: [profile.userName, [Validators.required, Validators.minLength(3)]],
      bio: [profile.bio],
      interests: [profile.interests]
    });

    this.displayImageUrl = profile.imageUrl
      ? `${this.baseUrl}/${profile.imageUrl}?t=${new Date().getTime()}`
      : 'assets/default-avatar.png';

    this.f['userName'].valueChanges.subscribe(() => {
      this.userNameExists = false;
    });

    this.loading = false;
  }

  enableEdit(): void {
    if (!this.isOwnProfile) return;
    this.isEditing = true;
  }

  cancelEdit(): void {
    if (!this.isOwnProfile || !this.profile) return;

    this.isEditing = false;
    this.selectedImageFile = undefined;
    this.userNameExists = false;

    this.profileForm.patchValue({
      fullName: this.profile.fullName,
      userName: this.profile.userName,
      bio: this.profile.bio,
      interests: this.profile.interests
    });
  }

  onFileSelected(file: File): void {
    if (!this.isOwnProfile) return;
    this.selectedImageFile = file;
    this.updateProfileImage(); // Add this line to automatically update when file is selected
  }
  onImageLoaded(): void {
    setTimeout(() => {
      this.imageJustUpdated = false;
    }, 500);
  }

  onSubmit(formValues: {
    fullName: string;
    userName: string;
    bio: string;
    interests: string;
  }): void {
    if (!this.isOwnProfile || !this.profile) return;
  
    const formData = new FormData();
    formData.append('fullName', formValues.fullName);
    formData.append('userName', formValues.userName);
    formData.append('bio', formValues.bio || '');
    formData.append('interests', formValues.interests || '');
  
    if (this.selectedImageFile) {
      formData.append('imageFile', this.selectedImageFile);
    }
  
    this.userProfileService.UpdateMyProfile(formData).subscribe({
      next: () => {
        this.toastr.success('Perfil atualizado com sucesso!');
        this.selectedImageFile = undefined;
        this.imageJustUpdated = true;
        this.isEditing = false;
        this.loadOwnProfile();
      },
      error: (error) => {
        if (error.status === 400 && error.error === 'Nome de usuário já está em uso.') {
          this.userNameExists = true;
        } else {
          this.toastr.error('Erro ao atualizar perfil.');
        }
      }
    });
  }

  updateProfileImage(): void {
    if (!this.selectedImageFile) return;
  
    const formData = new FormData();
    formData.append('imageFile', this.selectedImageFile);
  
    this.userProfileService.UpdateMyProfile(formData).subscribe({
      next: (response) => {
        this.imageJustUpdated = true;
        this.selectedImageFile = undefined;
        
        // Force a new URL with timestamp to prevent caching
        this.displayImageUrl = `${environment.apiBaseUrl}/${response.imageUrl}?t=${new Date().getTime()}`;
        
        // Optionally, you can also reload the profile to ensure all data is fresh
        this.loadOwnProfile();
        
        this.toastr.success('Foto de perfil atualizada com sucesso!');
      },
      error: (error) => {
        this.toastr.error('Erro ao atualizar foto de perfil.');
        console.error('Error updating profile image:', error);
      }
    });
  }

  private sendProfileUpdateRequest(onlyImageUpdate: boolean = false): void {
    const formValues = this.profileForm.value as {
      fullName: string;
      bio: string;
      userName: string;
      interests: string;
    };

    const formData = new FormData();
    formData.append('fullName', formValues.fullName);
    formData.append('bio', formValues.bio || '');
    formData.append('userName', formValues.userName);
    formData.append('interests', formValues.interests);

    if (this.selectedImageFile) {
      formData.append('imageFile', this.selectedImageFile);
    }

    this.userProfileService.UpdateMyProfile(formData).subscribe({
      next: () => {
        const msg = onlyImageUpdate ? 'Foto de perfil atualizada!' : 'Perfil atualizado com sucesso!';
        this.toastr.success(msg);

        this.selectedImageFile = undefined;
        this.imageJustUpdated = true;

        if (!onlyImageUpdate) this.isEditing = false;

        this.loadOwnProfile();
      },
      error: (error) => {
        if (error.status === 400 && error.error === 'Nome de usuário já está em uso.') {
          this.userNameExists = true;
        } else {
          const msg = onlyImageUpdate ? 'Erro ao atualizar foto de perfil.' : 'Erro ao atualizar perfil.';
          this.toastr.error(msg);
        }
      }
    });
  }

  

  onDeleteMyProfile(): void {
    this.userProfileService.deleteUser().subscribe({
      next: () => {
        this.toastr.success('Perfil excluído com sucesso.');
        this.authService.lougout();
        setTimeout(() => {
          this.router.navigateByUrl('/login');
        }, 1500);
      },
      error: (error) => {
        if (error.status === 403) {
          this.toastr.error('Você não tem permissão para excluir este perfil.');
        } else {
          this.toastr.error('Erro ao excluir o perfil.');
        }
      }
    });
  }
  

  get f(): { [key: string]: AbstractControl } {
    return this.profileForm.controls;
  }

 
}