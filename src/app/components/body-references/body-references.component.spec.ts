import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BodyReferencesComponent } from './body-references.component';

describe('BodyReferencesComponent', () => {
  let component: BodyReferencesComponent;
  let fixture: ComponentFixture<BodyReferencesComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [BodyReferencesComponent]
    });
    fixture = TestBed.createComponent(BodyReferencesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
