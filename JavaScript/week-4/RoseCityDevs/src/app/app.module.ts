import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { MaterialModule } from '@angular/material';

import { AppComponent } from './app.component';
import 'hammerjs';
import { NavBarComponent } from './nav-bar/nav-bar.component';
import { masterFirebaseConfig } from "./api-keys";
import { AngularFireModule } from "angularfire2";
import { IndexComponent } from './index/index.component';
import { routing } from "./app.routing";
import { AboutComponent } from './about/about.component';
import { MembersComponent } from './members/members.component';
import { DevCardComponent } from './dev-card/dev-card.component';
import { ProfileComponent } from './profile/profile.component';
import { RoleFilterPipe } from './role-filter.pipe';
import { AdminComponent } from './admin/admin.component';
import { FooterBarComponent } from './footer-bar/footer-bar.component';
import { NewMemberComponent } from './new-member/new-member.component';
import { TruncatePipe } from './truncate.pipe';
import { EditMemberComponent } from './edit-member/edit-member.component';

export const firebaseConfig = {
  apiKey: masterFirebaseConfig.apiKey,
  authDomain: masterFirebaseConfig.authDomain,
  databaseURL: masterFirebaseConfig.databaseURL,
  storageBucket: masterFirebaseConfig.storageBucket
};

@NgModule({
  declarations: [
    AppComponent,
    NavBarComponent,
    IndexComponent,
    AboutComponent,
    MembersComponent,
    DevCardComponent,
    ProfileComponent,
    RoleFilterPipe,
    AdminComponent,
    FooterBarComponent,
    NewMemberComponent,
    TruncatePipe,
    EditMemberComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    MaterialModule.forRoot(),
    AngularFireModule.initializeApp(firebaseConfig),
    routing
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
