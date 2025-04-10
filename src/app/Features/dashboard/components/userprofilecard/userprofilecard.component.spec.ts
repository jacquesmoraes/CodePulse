import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserprofilecardComponent } from './userprofilecard.component';

describe('UserprofilecardComponent', () => {
  let component: UserprofilecardComponent;
  let fixture: ComponentFixture<UserprofilecardComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [UserprofilecardComponent]
    });
    fixture = TestBed.createComponent(UserprofilecardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
