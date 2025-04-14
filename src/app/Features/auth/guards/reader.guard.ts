import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

export const readerGuard: CanActivateFn = () => {
  const authService = inject(AuthService);
  const router = inject(Router);
  const user = authService.getUser();

  if (!user) {
    return router.createUrlTree(['/login']);
  }

  if (user.roles.includes('User')) {
    return true; // permite acesso normal
  }

  if (user.roles.includes('Writer')) {
    return router.createUrlTree(['/dashboard']); // redireciona writer
  }

  // qualquer outro papel ou sem permissão
  return router.createUrlTree(['/login']);
};
