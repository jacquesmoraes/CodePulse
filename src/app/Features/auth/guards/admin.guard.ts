import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { jwtDecode } from 'jwt-decode';
import { CookieService } from 'ngx-cookie-service';
import { AuthService } from '../services/auth.service';

export const adminGuard: CanActivateFn = (route, state) => {
  const cookieService = inject(CookieService);
  const authService = inject(AuthService);
  const router = inject(Router);
  const user = authService.getUser();

  let token = cookieService.get('Authorization');
  if (token && user) {
    token = token.replace('Bearer', '');
    const decodedToken: any = jwtDecode(token);
    const expirationDate = decodedToken.exp * 1000;
    const currentDate = new Date().getTime();

    if (expirationDate < currentDate) {
      authService.lougout();
      return router.createUrlTree(['/login'], { queryParams: { returnUrl: state.url } });
    }

    if (user.roles.includes('Admin')) {
      return true;
    } else {
      alert('Acesso restrito a administradores.');
      return false;
    }
  } else {
    authService.lougout();
    return router.createUrlTree(['/login'], { queryParams: { returnUrl: state.url } });
  }
};
