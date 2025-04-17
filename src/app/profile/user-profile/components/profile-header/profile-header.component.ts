import { Component, EventEmitter, Input, Output } from '@angular/core';
import { UserProfile } from '../../shared/models/user-profile.model';

@Component({
  selector: 'app-profile-header',
  templateUrl: './profile-header.component.html',
  styleUrls: ['./profile-header.component.css']
})
export class ProfileHeaderComponent {
  @Input() profile?: UserProfile;
  @Input() isOwnProfile: boolean = false;
  @Input() displayImageUrl: string = '';
  @Input() favoritesCount: number = 0;
  @Input() writerPostsCount: number = 0;
  @Input() imageJustUpdated: boolean = false;

  @Output() photoSelected = new EventEmitter<File>();
  @Output() imageLoaded = new EventEmitter<void>();

  onFileSelected(event: Event): void {
    const input = event.target as HTMLInputElement;
    if (input.files && input.files.length > 0) {
      this.photoSelected.emit(input.files[0]);
    }
  }

  onImageLoad(): void {
    this.imageLoaded.emit();
  }

}
