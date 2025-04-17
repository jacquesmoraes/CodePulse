import { Component, EventEmitter, Input, Output } from '@angular/core';
import { BlogPost } from 'src/app/Features/blog-post/models/blog-post.model';
import { FavoritePost } from 'src/app/Features/favorite/favorite-post.model';

@Component({
  selector: 'app-favorites-section',
  templateUrl: './favorites-section.component.html',
  styleUrls: ['./favorites-section.component.css']
})
export class FavoritesSectionComponent {
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
    if (this.activeFilter === 'posts' && this.isWriter) {
      return `Posts publicados por ${this.profile?.fullName || ''}`;
    }
    return 'Posts Favoritos';
  }

  get displayPosts(): any[] {
    if (this.activeFilter === 'posts' && this.isWriter) {
      return this.writerPosts;
    }
    return this.favoritePosts;
  }

  onFilterChange(filter: string): void {
    this.filterChange.emit(filter);
  }

  onRemoveFavorite(favoriteId: string): void {
    this.removeFavorite.emit(favoriteId);
  }
}