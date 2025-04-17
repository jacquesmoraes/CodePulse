import { Component, EventEmitter, Input, Output } from '@angular/core';
import { BlogPost } from 'src/app/Features/blog-post/models/blog-post.model';
import { FavoritePost } from 'src/app/Features/favorite/favorite-post.model';

@Component({
  selector: 'app-writer-profile-section',
  templateUrl: './writer-profile-section.component.html',
  styleUrls: ['./writer-profile-section.component.css']
})
export class WriterProfileSectionComponent {
  @Input() favoritePosts: FavoritePost[] = [];
  @Input() writerPosts: BlogPost[] = [];
  @Input() isOwnProfile: boolean = false;
  @Input() favoritesLoading: boolean = false;
  @Input() activeFilter: string = 'all';
  @Input() profile?: any;

  @Output() filterChange = new EventEmitter<string>();
  @Output() removeFavorite = new EventEmitter<string>();

  get isWriter(): boolean {
    return this.profile?.role === 'Writer';
  }

  get sectionTitle(): string {
    if (this.isWriter) {
      return this.activeFilter === 'posts' 
        ? `Posts publicados por ${this.profile?.fullName || ''}`
        : 'Posts Favoritos';
    }
    return 'Posts Favoritos';
  }

  onFilterChange(filter: string): void {
    this.filterChange.emit(filter);
  }

  onRemoveFavorite(favoriteId: string): void {
    this.removeFavorite.emit(favoriteId);
  }
}