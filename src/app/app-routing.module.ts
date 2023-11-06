import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { HomeComponent } from './components/home/home.component';
import { CallsListComponent } from './components/calls-list/calls-list.component';

const routes: Routes = [
  {path:'', component: HomeComponent},
  {path:'list', component: CallsListComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
