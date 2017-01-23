import {Component, Input, EventEmitter, Output} from "@angular/core";
import {Entry} from "./entry.model";


@Component({
  selector: 'edit-entry',
  template: `
    <div class="card" *ngIf="selectedEntry">
      <div class="card-content">
        <span class="card-title">Edit Food Entry</span>
        <form>
          <div class="input-field">
            <input id="edit-entry-name" type="text" name="edit-entry-name" [(ngModel)]="selectedEntry.name">
            <label for="edit-entry-name" class="active">Name</label>
          </div>
          <div class="input-field">
            <input id="edit-entry-details" type="text" name="edit-entry-details" [(ngModel)]="selectedEntry.details">
            <label for="edit-entry-details" class="active">Details</label>
          </div>
          <div class="input-field">
            <input id="edit-entry-calories" type="text" name="edit-entry-calories" [(ngModel)]="selectedEntry.calories">
            <label for="edit-entry-calories" class="active">Calories</label>
          </div>
          <a  class="btn right" (click)="doneButtonClicked()">Close</a>
        </form>
        
      </div>
    </div>
  `
})

export class EditEntryComponent {
  @Input() selectedEntry: Entry;
  @Output() doneButtonClickedSender = new EventEmitter();

  doneButtonClicked() {
    this.doneButtonClickedSender.emit();
  }
}