import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { UserProfile } from 'src/app/profile/models/user-profile.model';
import { UserProfileService } from 'src/app/profile/user-profile.service';

@Component({
  selector: 'app-writer-profile',
  templateUrl: './writer-profile.component.html',
  styleUrls: ['./writer-profile.component.css']
})
export class WriterProfileComponent implements OnInit {
  profileForm!: FormGroup;
  passwordForm!: FormGroup;
  profile?: UserProfile;
  isEditing = false;
  userNameExists = false;
  passwordFocused = false;

  criteriaList = [
    { key: 'hasUpperCase', label: 'Pelo menos uma letra maiúscula', valid: false, loading: false },
    { key: 'hasNumber', label: 'Pelo menos um número', valid: false, loading: false },
    { key: 'hasSymbol', label: 'Pelo menos um símbolo (!@#$...)', valid: false, loading: false },
    { key: 'hasMinLength', label: 'Mínimo de 6 caracteres', valid: false, loading: false }
  ];

  constructor(
    private fb: FormBuilder,
    private userProfileService: UserProfileService,
    private toastr: ToastrService
  ) {}

  ngOnInit(): void {
    this.userProfileService.getProfile().subscribe({
      next: (profile) => {
        if (profile) {
          this.initProfileForm(profile);
        } else {
          this.userProfileService.GetMyProfile().subscribe({
            next: (fetchedProfile) => {
              this.userProfileService.setProfile(fetchedProfile);
              this.initProfileForm(fetchedProfile);
            },
            error: () => this.toastr.error('Erro ao carregar o perfil.')
          });
        }
      },
      error: () => this.toastr.error('Erro ao acessar perfil armazenado.')
    });

    this.passwordForm = this.fb.group({
      currentPassword: ['', Validators.required],
      newPassword: [
        '',
        [
          Validators.required,
          Validators.minLength(6),
          Validators.pattern(/^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])/)
        ]
      ]
    });

    this.passwordForm.get('newPassword')?.valueChanges.subscribe(password => {
      this.validatePassword(password);
    });
  }

  private initProfileForm(profile: UserProfile): void {
    this.profile = profile;

    this.profileForm = this.fb.group({
      fullName: [profile.fullName, [Validators.required, Validators.minLength(3)]],
      userName: [profile.userName, [Validators.required, Validators.minLength(3)]],
      bio: [profile.bio]
    });

    this.f['userName'].valueChanges.subscribe(() => {
      this.userNameExists = false;
    });
  }

  enableEdit(): void {
    this.isEditing = true;
  }

  cancelEdit(): void {
    if (!this.profile) return;

    this.isEditing = false;
    this.userNameExists = false;

    this.profileForm.patchValue({
      fullName: this.profile.fullName,
      userName: this.profile.userName,
      bio: this.profile.bio
    });
  }

  changePassword(): void {
    const { currentPassword, newPassword } = this.passwordForm.value;

    if (this.passwordForm.invalid) {
      this.passwordForm.markAllAsTouched();
      return;
    }

    this.userProfileService.updatePassword(currentPassword, newPassword).subscribe({
      next: () => {
        this.toastr.success('Senha atualizada com sucesso!');
        this.passwordForm.reset();
        this.criteriaList.forEach(c => (c.valid = false));
      },
      error: () => {
        this.toastr.error('Erro ao atualizar a senha. Verifique a senha atual.');
      }
    });
  }

  onSubmit(): void {
    if (this.profileForm.invalid) {
      this.profileForm.markAllAsTouched();
      return;
    }

    this.sendProfileUpdateRequest();
  }

  private sendProfileUpdateRequest(): void {
    const formValues = this.profileForm.value;
    const formData = new FormData();

    formData.append('fullName', formValues.fullName);
    formData.append('bio', formValues.bio || '');
    formData.append('userName', formValues.userName);

    this.userProfileService.UpdateMyProfile(formData).subscribe({
      next: () => {
        this.toastr.success('Perfil atualizado com sucesso!');
        this.isEditing = false;
        this.userNameExists = false;
        this.loadLatestProfile();
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

  private loadLatestProfile(): void {
    this.userProfileService.GetMyProfile().subscribe({
      next: (profile) => {
        this.profile = profile;
        this.profileForm.patchValue({
          fullName: profile.fullName,
          userName: profile.userName,
          bio: profile.bio
        });
      }
    });
  }

  validatePassword(password: string): void {
    const validations = {
      hasUpperCase: /[A-Z]/.test(password),
      hasNumber: /\d/.test(password),
      hasSymbol: /[!@#$%^&*(),.?":{}|<>]/.test(password),
      hasMinLength: password.length >= 6
    };

    this.criteriaList.forEach((item) => {
      const wasValid = item.valid;
      const isNowValid = validations[item.key as keyof typeof validations];

      if (isNowValid && !wasValid) {
        item.loading = true;
        setTimeout(() => {
          item.loading = false;
          item.valid = true;
        }, 400);
      } else if (!isNowValid) {
        item.valid = false;
        item.loading = false;
      }
    });
  }

  get f() {
    return this.profileForm.controls;
  }

  get pf() {
    return this.passwordForm.controls;
  }
}
