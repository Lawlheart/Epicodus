/* tslint:disable:no-unused-variable */
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { DebugElement } from '@angular/core';

import { DevCardComponent } from './dev-card.component';

describe('DevCardComponent', () => {
  let component: DevCardComponent;
  let fixture: ComponentFixture<DevCardComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DevCardComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DevCardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
