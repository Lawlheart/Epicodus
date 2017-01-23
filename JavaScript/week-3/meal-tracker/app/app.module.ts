import { NgModule }       from '@angular/core';
import { BrowserModule }  from '@angular/platform-browser';
import { AppComponent }   from './app.component';
import { FormsModule } from '@angular/forms';
import { EntryListComponent } from "./entry-list.component";
import { NewEntryComponent } from "./new-entry.component";
import { EditEntryComponent } from "./edit-entry.component";
import {CaloriesPipe} from "./calories.pipe";

@NgModule({
  imports:      [ BrowserModule, FormsModule ],
  declarations: [ AppComponent, EntryListComponent, NewEntryComponent, EditEntryComponent, CaloriesPipe ],
  bootstrap:    [ AppComponent ]
})

export class AppModule { }
