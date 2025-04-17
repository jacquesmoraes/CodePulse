import { Component, EventEmitter, Input, Output } from '@angular/core';
import { UserProfile } from '../../shared/models/user-profile.model';

@Component({
  selector: 'app-profile-details',
  templateUrl: './profile-details.component.html',
  styleUrls: ['./profile-details.component.css']
})
export class ProfileDetailsComponent {
  @Input() profile?: UserProfile;
  @Input() isOwnProfile: boolean = false;
  
  // If you need to add edit functionality later
  @Output() enableEditing = new EventEmitter<void>();
}

