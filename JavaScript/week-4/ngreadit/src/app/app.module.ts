import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';

import { AppComponent } from './app.component';
import { IndexComponent } from './index/index.component';
import { routing } from './app.routing';
import { PostListComponent } from './post-list/post-list.component';
import { NoteListComponent } from './note-list/note-list.component';
import { BoardPipe } from './board.pipe';
import { NewPostComponent } from './new-post/new-post.component';
import { EditPostComponent } from './edit-post/edit-post.component';
import { PostDetailComponent } from './post-detail/post-detail.component';
import { StopPropogationDirective } from './stop-propogation.directive';

@NgModule({
  declarations: [
    AppComponent,
    IndexComponent,
    PostListComponent,
    NoteListComponent,
    BoardPipe,
    NewPostComponent,
    EditPostComponent,
    PostDetailComponent,
    StopPropogationDirective
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    routing
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
