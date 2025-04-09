import { ComponentFixture, TestBed } from '@angular/core/testing';

import { WriterSidebarComponent } from './writer-sidebar.component';

describe('WriterSidebarComponent', () => {
  let component: WriterSidebarComponent;
  let fixture: ComponentFixture<WriterSidebarComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [WriterSidebarComponent]
    });
    fixture = TestBed.createComponent(WriterSidebarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
