import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { User } from 'src/app/Features/auth/models/user.model';
import { AuthService } from 'src/app/Features/auth/services/auth.service';

@Component({
  selector: 'app-nav-bar',
  templateUrl: './nav-bar.component.html',
  styleUrls: ['./nav-bar.component.css']
})
export class NavBarComponent implements OnInit{
  
  user?: User;
  constructor(private authService: AuthService, private router: Router){

  }
  ngOnInit(): void {
    this.authService.user().subscribe({
      next: (response) => {
        this.user = response;
      }

    });
    this.user = this.authService.getUser();
  }

  onLogout(): void{
    this.authService.lougout();
    this.router.navigateByUrl('/')
  }

}
