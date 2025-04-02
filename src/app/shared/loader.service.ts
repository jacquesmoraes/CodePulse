import { inject, Injectable } from '@angular/core';
import { NgxSpinnerService } from 'ngx-spinner';

@Injectable({
  providedIn: 'root'
})
export class LoaderService {

  busyRequesCount = 0;
  private spinnerService = inject(NgxSpinnerService);

  busy(){
    this.busyRequesCount++;
    this.spinnerService.show(undefined,{
      type: 'pacman',
      bdColor: 'rgba(255,255,255,1)',
      color :'#333333'
    });
  }

  idle(){
    this.busyRequesCount--;
    if(this.busyRequesCount <= 0 ){
      this.busyRequesCount = 0;
      this.spinnerService.hide();
    }
  }
}
