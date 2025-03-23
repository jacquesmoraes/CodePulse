import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DetailsBlogpostComponent } from './details-blogpost.component';

describe('DetailsBlogpostComponent', () => {
  let component: DetailsBlogpostComponent;
  let fixture: ComponentFixture<DetailsBlogpostComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [DetailsBlogpostComponent]
    });
    fixture = TestBed.createComponent(DetailsBlogpostComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
