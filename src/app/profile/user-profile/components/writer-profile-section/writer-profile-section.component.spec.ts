import { ComponentFixture, TestBed } from '@angular/core/testing';

import { WriterProfileSectionComponent } from './writer-profile-section.component';

describe('WriterProfileSectionComponent', () => {
  let component: WriterProfileSectionComponent;
  let fixture: ComponentFixture<WriterProfileSectionComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [WriterProfileSectionComponent]
    });
    fixture = TestBed.createComponent(WriterProfileSectionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
