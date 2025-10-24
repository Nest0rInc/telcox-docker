import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ConsultaSaldo } from './consulta-saldo';

describe('ConsultaSaldo', () => {
  let component: ConsultaSaldo;
  let fixture: ComponentFixture<ConsultaSaldo>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ConsultaSaldo]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ConsultaSaldo);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
