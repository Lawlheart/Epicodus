/* tslint:disable:no-unused-variable */

import { TestBed, async, inject } from '@angular/core/testing';
import { DeveloperService } from './developer.service';

describe('DeveloperService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [DeveloperService]
    });
  });

  it('should ...', inject([DeveloperService], (service: DeveloperService) => {
    expect(service).toBeTruthy();
  }));
});
