"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var core_1 = require('@angular/core');
var entry_model_1 = require('./entry.model');
var AppComponent = (function () {
    function AppComponent() {
        this.entries = [
            new entry_model_1.Entry("Oatmeal", "Big bowl, sweet", 500),
            new entry_model_1.Entry("Milk", "Whole, 16oz", 320)
        ];
        this.selectedEntry = null;
        this.newEntryForm = null;
    }
    AppComponent.prototype.saveEntry = function (newEntry) {
        this.entries.push(newEntry);
        this.newEntryForm = null;
    };
    AppComponent.prototype.closeEdit = function () {
        this.selectedEntry = null;
    };
    AppComponent.prototype.showEditForm = function (entry) {
        this.selectedEntry = entry;
    };
    AppComponent = __decorate([
        core_1.Component({
            selector: 'my-app',
            template: "\n  <div class=\"container\">\n    <h3 class=\"center-align blue-grey-text text-accent-2\">Meal Planner</h3>\n    <entry-list [entries]=\"entries\" (emitClickEdit)=\"showEditForm($event)\"></entry-list>\n    \n    <button class=\"btn\" (click)=\"newEntryForm = true;\" *ngIf=\"!newEntryForm\">Create New Entry</button>\n    <button class=\"btn\" (click)=\"newEntryForm = false;\" *ngIf=\"newEntryForm\">Close Form</button>\n    \n    <new-entry (saveEntrySender)=\"saveEntry($event)\" *ngIf=\"newEntryForm\"></new-entry>\n    \n    <edit-entry [selectedEntry]=\"selectedEntry\" (doneButtonClickedSender)=\"closeEdit()\"></edit-entry>\n  </div>\n  "
        }), 
        __metadata('design:paramtypes', [])
    ], AppComponent);
    return AppComponent;
}());
exports.AppComponent = AppComponent;
//# sourceMappingURL=app.component.js.map