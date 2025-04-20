import { ComponentFixture, TestBed } from '@angular/core/testing';

import { WriterPostsComponent } from './writer-posts.component';

describe('WriterPostsComponent', () => {
  let component: WriterPostsComponent;
  let fixture: ComponentFixture<WriterPostsComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [WriterPostsComponent]
    });
    fixture = TestBed.createComponent(WriterPostsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
