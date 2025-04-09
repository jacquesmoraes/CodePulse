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

    const url = state.url;

    // ✅ Se for Writer e tentar acessar /aboutme ou /admin, redireciona para dashboard
    if (
      user.roles.includes('Writer') &&
      !user.roles.includes('Admin') &&
      (url.startsWith('/aboutme') || url.startsWith('/admin'))
    ) {
      return router.createUrlTree(['/dashboard']);
    }

    // ✅ Se for Reader e tentar acessar /dashboard ou /admin, redireciona para aboutme
    if (
      user.roles.includes('Reader') &&
      !user.roles.includes('Admin') &&
      (url.startsWith('/dashboard') || url.startsWith('/admin'))
    ) {
      return router.createUrlTree(['/aboutme']);
    }

    // ✅ Token válido e usuário tem alguma role permitida
    return true;
  }

  // ❌ Usuário não autenticado
  authService.lougout();
  return router.createUrlTree(['/login'], { queryParams: { returnUrl: state.url } });
};
