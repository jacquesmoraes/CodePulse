import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { WriterModule } from './writer/writer.module';
import { SharedModule } from './shared/shared.module';
import { AdminModule } from './admin/admin.module';




@NgModule({
 
  imports: [
    CommonModule,
    SharedModule,
    AdminModule,
    WriterModule
   
    
  ],
  exports:[
   SharedModule,
    AdminModule,    
    WriterModule    
  ]
})
export class DashboardModule { }
