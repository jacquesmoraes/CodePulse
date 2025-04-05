import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { UserProfile } from '../models/user-profile.model';
import { UpdateProfile } from '../models/update-profile.model';
import { UserProfileService } from '../user-profile.service';

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

  constructor(
    private fb: FormBuilder,
    private userProfileService: UserProfileService,
    private toastr: ToastrService
  ) {}

  ngOnInit(): void {
    this.userProfileService.GetMyProfile().subscribe({
      next: (profile) => {
        this.profile = profile;
        this.profileForm = this.fb.group({
          fullName: [profile.fullName, [Validators.required, Validators.minLength(3)]],
          bio: [profile.bio],
          photoUrl: [profile.photoUrl]
        });
        this.loading = false;
      },
      error: () => {
        this.toastr.error('Erro ao carregar o perfil.');
        this.loading = false;
      }
    });
  }

  enableEdit() {
    this.isEditing = true;
  }

  cancelEdit() {
    this.isEditing = false;
    if (this.profile) {
      this.profileForm.patchValue({
        fullName: this.profile.fullName,
        bio: this.profile.bio,
        photoUrl: this.profile.photoUrl
      });
    }
  }

  onSubmit(): void {
    if (this.profileForm.invalid) {
      this.profileForm.markAllAsTouched();
      return;
    }

    const data: UpdateProfile = this.profileForm.value;

    this.userProfileService.UpdateMyProfile(data).subscribe({
      next: (updated:UserProfile) => {
        this.profile = updated;
        this.toastr.success('Perfil atualizado com sucesso!');
        this.isEditing = false;
      },
      error: () => {
        this.toastr.error('Erro ao atualizar perfil.');
      }
    });
  }

  get f() {
    return this.profileForm.controls;
  }
}
