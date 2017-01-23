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
var NewEntryComponent = (function () {
    function NewEntryComponent() {
        this.saveEntrySender = new core_1.EventEmitter();
    }
    NewEntryComponent.prototype.submitSaveEntry = function (name, details, value) {
        var newEntry = new entry_model_1.Entry(name, details, value);
        this.saveEntrySender.emit(newEntry);
    };
    __decorate([
        core_1.Output(), 
        __metadata('design:type', Object)
    ], NewEntryComponent.prototype, "saveEntrySender", void 0);
    NewEntryComponent = __decorate([
        core_1.Component({
            selector: 'new-entry',
            template: "\n    <div class=\"card\">\n      <div class=\"card-content\">\n        <span class=\"card-title\">New Food Entry</span>\n        <form>\n          <div class=\"input-field\">\n            <input #newEntryName id=\"new-entry-name\" type=\"text\">\n            <label for=\"new-entry-name\">Name</label>\n          </div>\n          <div class=\"input-field\">\n            <input #newEntryDetails id=\"new-entry-details\" type=\"text\">\n            <label for=\"new-entry-details\">Details</label>\n          </div>\n          <div class=\"input-field\">\n            <input #newEntryCalories id=\"new-entry-calories\" type=\"text\">\n            <label for=\"new-entry-calories\">Calories</label>\n          </div>\n          <a (click)=\"\n            submitSaveEntry(newEntryName.value, newEntryDetails.value, newEntryCalories.value); \n            newEntryName.value =''; \n            newEntryDetails.value = ''; \n            newEntryCalories.value = ''; \n            \" class=\"btn right\">Add</a>\n        </form>\n        \n      </div>\n    </div>\n  "
        }), 
        __metadata('design:paramtypes', [])
    ], NewEntryComponent);
    return NewEntryComponent;
}());
exports.NewEntryComponent = NewEntryComponent;
//# sourceMappingURL=new-entry.component.js.map