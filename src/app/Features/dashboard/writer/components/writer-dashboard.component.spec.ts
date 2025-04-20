import { ComponentFixture, TestBed } from '@angular/core/testing';
import { WriterDashboardComponent } from './writer-dashboard.component';


describe('writer-DashboardComponent', () => {
  let component: WriterDashboardComponent;
  let fixture: ComponentFixture<WriterDashboardComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [WriterDashboardComponent]
    });
    fixture = TestBed.createComponent(WriterDashboardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
