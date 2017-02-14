import { Routes, RouterModule } from "@angular/router";
import { ModuleWithProviders } from "@angular/core";
import { IndexComponent } from "./index/index.component";
import { AboutComponent } from "./about/about.component";
import { MembersComponent } from "./members/members.component";
import { ProfileComponent } from "./profile/profile.component";
import { AdminComponent } from "./admin/admin.component";


const appRoutes: Routes = [{
  path: '',
  component: IndexComponent
}, {
  path: 'about',
  component: AboutComponent
}, {
  path: 'members',
  component: MembersComponent
}, {
  path: 'admin',
  component: AdminComponent
}, {
  path: 'profile/:id',
  component: ProfileComponent
}];

export const routing: ModuleWithProviders = RouterModule.forRoot(appRoutes);
