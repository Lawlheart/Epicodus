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
var core_1 = require("@angular/core");
var entry_model_1 = require("./entry.model");
var EditEntryComponent = (function () {
    function EditEntryComponent() {
        this.doneButtonClickedSender = new core_1.EventEmitter();
    }
    EditEntryComponent.prototype.doneButtonClicked = function () {
        this.doneButtonClickedSender.emit();
    };
    __decorate([
        core_1.Input(), 
        __metadata('design:type', entry_model_1.Entry)
    ], EditEntryComponent.prototype, "selectedEntry", void 0);
    __decorate([
        core_1.Output(), 
        __metadata('design:type', Object)
    ], EditEntryComponent.prototype, "doneButtonClickedSender", void 0);
    EditEntryComponent = __decorate([
        core_1.Component({
            selector: 'edit-entry',
            template: "\n    <div class=\"card\" *ngIf=\"selectedEntry\">\n      <div class=\"card-content\">\n        <span class=\"card-title\">Edit Food Entry</span>\n        <form>\n          <div class=\"input-field\">\n            <input id=\"edit-entry-name\" type=\"text\" name=\"edit-entry-name\" [(ngModel)]=\"selectedEntry.name\">\n            <label for=\"edit-entry-name\" class=\"active\">Name</label>\n          </div>\n          <div class=\"input-field\">\n            <input id=\"edit-entry-details\" type=\"text\" name=\"edit-entry-details\" [(ngModel)]=\"selectedEntry.details\">\n            <label for=\"edit-entry-details\" class=\"active\">Details</label>\n          </div>\n          <div class=\"input-field\">\n            <input id=\"edit-entry-calories\" type=\"text\" name=\"edit-entry-calories\" [(ngModel)]=\"selectedEntry.calories\">\n            <label for=\"edit-entry-calories\" class=\"active\">Calories</label>\n          </div>\n          <a  class=\"btn right\" (click)=\"doneButtonClicked()\">Close</a>\n        </form>\n        \n      </div>\n    </div>\n  "
        }), 
        __metadata('design:paramtypes', [])
    ], EditEntryComponent);
    return EditEntryComponent;
}());
exports.EditEntryComponent = EditEntryComponent;
//# sourceMappingURL=edit-entry.component.js.map