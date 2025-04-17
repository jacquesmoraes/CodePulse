import { Component, EventEmitter, Input, Output } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { UserProfile } from '../../shared/models/user-profile.model';

@Component({
  selector: 'app-profile-edit-form',
  templateUrl: './profile-edit-form.component.html',
  styleUrls: ['./profile-edit-form.component.css']
})
export class ProfileEditFormComponent {
  @Input() profile?: UserProfile;
  @Input() userNameExists: boolean = false;

  @Output() formSubmit = new EventEmitter<any>();
  @Output() cancelEdit = new EventEmitter<void>();
  @Output() deleteProfile = new EventEmitter<void>();

  profileForm!: FormGroup;

  constructor(private fb: FormBuilder) {}

  ngOnInit(): void {
    this.initForm();
  }

  private initForm(): void {
    if (!this.profile) return;

    this.profileForm = this.fb.group({
      fullName: [this.profile.fullName, [Validators.required, Validators.minLength(3)]],
      userName: [this.profile.userName, [Validators.required, Validators.minLength(3)]],
      bio: [this.profile.bio],
      interests: [this.profile.interests]
    });
  }

  onSubmit(): void {
    if (this.profileForm.valid) {
      this.formSubmit.emit(this.profileForm.value);
    }
  }

  onCancel(): void {
    this.cancelEdit.emit();
  }

  onDelete(): void {
    if (confirm('Tem certeza que deseja excluir seu perfil? Esta ação não poderá ser desfeita.')) {
      this.deleteProfile.emit();
    }
  }

  // Helper methods for form validation
  get f() { 
    return this.profileForm.controls; 
  }
}
