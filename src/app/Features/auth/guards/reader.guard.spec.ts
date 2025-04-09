import { TestBed } from '@angular/core/testing';
import { CanActivateFn } from '@angular/router';

import { readerGuard } from './reader.guard';

describe('readerGuard', () => {
  const executeGuard: CanActivateFn = (...guardParameters) => 
      TestBed.runInInjectionContext(() => readerGuard(...guardParameters));

  beforeEach(() => {
    TestBed.configureTestingModule({});
  });

  it('should be created', () => {
    expect(executeGuard).toBeTruthy();
  });
});
