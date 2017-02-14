import { Component, OnInit, Input } from '@angular/core';
import { Note } from '../note.model';

@Component({
  selector: 'note-list',
  templateUrl: './note-list.component.html',
  styleUrls: ['./note-list.component.css']
})
export class NoteListComponent {
  @Input() notes: Note[];

}
