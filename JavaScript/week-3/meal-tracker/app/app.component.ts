import { Component } from '@angular/core';
import { Entry } from './entry.model';

@Component({
  selector: 'my-app',
  template: `
  <div class="container">
    <h3 class="center-align blue-grey-text text-accent-2">Meal Planner</h3>
    <entry-list [entries]="entries" (emitClickEdit)="showEditForm($event)"></entry-list>
    
    <button class="btn" (click)="newEntryForm = true;" *ngIf="!newEntryForm">Create New Entry</button>
    <button class="btn" (click)="newEntryForm = false;" *ngIf="newEntryForm">Close Form</button>
    
    <new-entry (saveEntrySender)="saveEntry($event)" *ngIf="newEntryForm"></new-entry>
    
    <edit-entry [selectedEntry]="selectedEntry" (doneButtonClickedSender)="closeEdit()"></edit-entry>
  </div>
  `
})

export class AppComponent {
  entries: Entry[] = [
    new Entry("Oatmeal", "Big bowl, sweet", 500),
    new Entry("Milk", "Whole, 16oz", 320)
  ];

  selectedEntry = null;
  newEntryForm = null;

  saveEntry(newEntry) {
    this.entries.push(newEntry);
    this.newEntryForm = null;
  }
  closeEdit() {
    this.selectedEntry = null;
  }

  showEditForm(entry) {
    this.selectedEntry = entry;
  }
}
