import {Component, Input, Output, EventEmitter} from "@angular/core";
import {Entry} from "./entry.model";

@Component({
  selector: 'entry-list',
  template: `

    <div class="buttons row">
      <a class="btn col m4" (click)="setFilter('allEntries')">All Entries</a>
      <a class="btn col m4" (click)="setFilter('highCalorie')">High Calorie</a>
      <a class="btn col m4" (click)="setFilter('lowCalorie')">Low Calorie</a>
    </div>
    <ul class="collection with-header">
      <li class="collection-header teal-text">
        Entries
        <span class="secondary-content">
           Calories
        </span>
      </li>
      <li class="collection-item anchor" *ngFor="let entry of entries | calories:caloriesFilter">
        <span>{{entry.name}} - </span><span class="blue-grey-text">{{entry.details}}</span>
        <span class="secondary-content">
           {{entry.calories}}
        </span>
        
          <div class="fixed-action-btn absolute left-button">
            <a class="btn-floating btn-small waves-effect waves-light blue-grey" (click)="clickEdit(entry)"><i class="material-icons">mode_edit</i></a>
          </div>
      </li>
    </ul>`
})

export class EntryListComponent {
  @Input() entries: Entry[];
  @Output() emitClickEdit = new EventEmitter();

  caloriesFilter: string = 'allEntries';

  setFilter(newFilter) {
    this.caloriesFilter = newFilter;
  }

  clickEdit(entry) {
    this.emitClickEdit.emit(entry);
  }
}