import { ComponentFixture, TestBed } from '@angular/core/testing';

import { WriterPostsListComponent } from './writer-posts-list.component';

describe('WriterPostsListComponent', () => {
  let component: WriterPostsListComponent;
  let fixture: ComponentFixture<WriterPostsListComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [WriterPostsListComponent]
    });
    fixture = TestBed.createComponent(WriterPostsListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
