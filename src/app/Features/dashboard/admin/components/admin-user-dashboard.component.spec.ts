import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminUserDashboardComponent } from './admin-user-dashboard.component';

describe('AdminUserDashboardComponent', () => {
  let component: AdminUserDashboardComponent;
  let fixture: ComponentFixture<AdminUserDashboardComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AdminUserDashboardComponent]
    });
    fixture = TestBed.createComponent(AdminUserDashboardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
