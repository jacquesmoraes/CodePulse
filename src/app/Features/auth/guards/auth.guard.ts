import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { AuthService } from '../services/auth.service';
import { jwtDecode } from 'jwt-decode';

export const authGuard: CanActivateFn = (route, state) => {
  const cookieService = inject(CookieService);
  const authService = inject(AuthService);
  const router = inject(Router);
  const user = authService.getUser();
  //check for jwt token
  let token = cookieService.get('Authorization');
  if (token && user) {
    token = token.replace('Bearer', '');
    const decodedToken: any = jwtDecode(token);
    //chek if the token has expired
    const expirationDate = decodedToken.exp * 1000;
    const curentDate = new Date().getTime();
    if (expirationDate < curentDate) {
      authService.lougout();
      return router.createUrlTree(['/login'], { queryParams: { returnUrl: state.url } })
    }
    else {
      // token still valid
      if (user.roles.includes('Writer')) {
        return true;
      }
      else {
        alert('unauthorized');
        return false;
      }
    }
  }
  else {
    authService.lougout();
    return router.createUrlTree(['/login'], { queryParams: { returnUrl: state.url } })
  }
};
