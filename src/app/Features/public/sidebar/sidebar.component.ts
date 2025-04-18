import { Component, Input, Output, EventEmitter, OnInit, OnDestroy } from '@angular/core';
import { BlogPost } from '../../blog-post/models/blog-post.model';
import { Category } from '../../Categories/models/category.model';
import { Observable, Subject, takeUntil } from 'rxjs';

@Component({
  selector: 'side-bar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent implements OnInit, OnDestroy {
  @Input() recentPosts: BlogPost[] = [];
  @Input() popularPosts: BlogPost[] = [];
  @Input() categories: Category[] = [];
  @Input() selectedCategoryIds: string[] = [];
  @Input() popularLoading: boolean = true;
  @Input() sidebarLoading: boolean = true;
  @Input() trackByFn!: (index: number, item: any) => any;
  @Input() categories$!: Observable<Category[]>;
  @Output() categoryClicked = new EventEmitter<string>();
  @Output() categoryRemoved = new EventEmitter<string>();
  @Output() clearCategories = new EventEmitter<void>();

  private destroy$ = new Subject<void>();

  ngOnInit(): void {
    (this.categories$ as Observable<Category[]>)
      .pipe(takeUntil(this.destroy$))
      .subscribe((cats) => {
        this.categories = cats;
      });
  }

  ngOnDestroy(): void {
    this.destroy$.next();
    this.destroy$.complete();
  }

  getCategoryName(id: string): string {
    const category = this.categories.find(c => c.id === id);
    return category?.name ?? '';
  }
}
