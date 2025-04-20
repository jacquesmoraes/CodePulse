import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { WriterPostsComponent } from './components/writer-posts/writer-posts.component';
import { WriterSidebarComponent } from './components/writer-sidebar/writer-sidebar.component';
import { WriterPostsListComponent } from './components/writer-posts-list/writer-posts-list.component';
import { WriterProfileComponent } from './components/writer-profile/writer-profile.component';
import { ReactiveFormsModule } from '@angular/forms';
import { WriterRoutingModule } from './writer-routing.module';
import { SharedModule } from '../shared/shared.module';
import { NgApexchartsModule } from 'ng-apexcharts';
import { WriterDashboardComponent } from './components/writer-dashboard.component';



@NgModule({
  declarations: [
    WriterDashboardComponent,
    WriterPostsComponent,
    WriterSidebarComponent,
    WriterPostsListComponent,
    WriterProfileComponent

  ],
  imports: [
    CommonModule,
    ReactiveFormsModule,
   WriterRoutingModule,
   SharedModule,
   NgApexchartsModule
  ],
  exports:[
    WriterPostsComponent,
    WriterPostsListComponent,
    WriterProfileComponent,
    WriterDashboardComponent
  ]
})
export class WriterModule { }
