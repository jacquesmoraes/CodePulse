import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { UserProfile } from '../models/user-profile.model';
import { UserProfileService } from '../user-profile.service';
import { environment } from 'src/environments/environment';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-user-profile',
  templateUrl: './user-profile.component.html',
  styleUrls: ['./user-profile.component.css']
})
export class UserProfileComponent implements OnInit {
  profileForm!: FormGroup;
  profile?: UserProfile;
  isEditing = false;
  loading = true;
  selectedImageFile?: File;
  displayImageUrl: string = '';
  baseUrl: string = environment.apiBaseUrl;
  imageJustUpdated = false;
  userNameExists = false;
  isOwnProfile = false;

  constructor(
    private fb: FormBuilder,
    private userProfileService: UserProfileService,
    private toastr: ToastrService,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    const username = this.route.snapshot.paramMap.get('username');

    if (username) {
      this.loadPublicProfile(username);
    } else {
      this.loadOwnProfile();
    }
  }

  loadOwnProfile(): void {
    this.loading = true;
    this.isOwnProfile = true;

    this.userProfileService.GetMyProfile().subscribe({
      next: (profile) => this.initProfileForm(profile),
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
      next: (profile) => {
        this.profile = profile;
        this.displayImageUrl = profile.imageUrl
          ? `${this.baseUrl}/${profile.imageUrl}`
          : 'assets/default-avatar.png';
        this.loading = false;
      },
      error: () => {
        this.toastr.error('Erro ao carregar perfil público.');
        this.loading = false;
      }
    });
  }

  private initProfileForm(profile: UserProfile): void {
    this.profile = profile;

    this.profileForm = this.fb.group({
      fullName: [profile.fullName, [Validators.required, Validators.minLength(3)]],
      userName: [profile.userName, [Validators.required, Validators.minLength(3)]],
      bio: [profile.bio],
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
      bio: this.profile.bio
    });
  }

  onFileSelected(event: Event): void {
    if (!this.isOwnProfile) return;

    const input = event.target as HTMLInputElement;
    if (input.files && input.files.length > 0) {
      this.selectedImageFile = input.files[0];
    }
  }

  onSubmit(): void {
    if (!this.isOwnProfile || this.profileForm.invalid) {
      this.profileForm.markAllAsTouched();
      return;
    }

    this.sendProfileUpdateRequest();
  }

  updateProfileImage(): void {
    if (!this.isOwnProfile || !this.selectedImageFile) return;

    this.sendProfileUpdateRequest(true);
  }

  private sendProfileUpdateRequest(onlyImageUpdate: boolean = false): void {
    const formValues = this.profileForm.value;
    const formData = new FormData();

    formData.append('fullName', formValues.fullName);
    formData.append('bio', formValues.bio || '');
    formData.append('userName', formValues.userName);

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

  get f() {
    return this.profileForm.controls;
  }

  onImageLoaded(): void {
    setTimeout(() => {
      this.imageJustUpdated = false;
    }, 500);
  }
}
