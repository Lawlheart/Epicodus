import {Component, EventEmitter, Output} from "@angular/core";
import {Entry} from "./entry.model";


@Component({
  selector: 'new-entry',
  template: `
    <div class="card">
      <div class="card-content">
        <span class="card-title">New Food Entry</span>
        <form>
          <div class="input-field">
            <input #newEntryName id="new-entry-name" type="text">
            <label for="new-entry-name">Name</label>
          </div>
          <div class="input-field">
            <input #newEntryDetails id="new-entry-details" type="text">
            <label for="new-entry-details">Details</label>
          </div>
          <div class="input-field">
            <input #newEntryCalories id="new-entry-calories" type="text">
            <label for="new-entry-calories">Calories</label>
          </div>
          <a (click)="
            submitSaveEntry(newEntryName.value, newEntryDetails.value, newEntryCalories.value); 
            newEntryName.value =''; 
            newEntryDetails.value = ''; 
            newEntryCalories.value = ''; 
            " class="btn right">Add</a>
        </form>
        
      </div>
    </div>
  `
})

export class NewEntryComponent {
  @Output() saveEntrySender = new EventEmitter();

  submitSaveEntry(name: string, details: string, value: number) {
    let newEntry = new Entry(name, details, value);
    this.saveEntrySender.emit(newEntry);
  }
}