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
var EntryListComponent = (function () {
    function EntryListComponent() {
        this.emitClickEdit = new core_1.EventEmitter();
        this.caloriesFilter = 'allEntries';
    }
    EntryListComponent.prototype.setFilter = function (newFilter) {
        this.caloriesFilter = newFilter;
    };
    EntryListComponent.prototype.clickEdit = function (entry) {
        this.emitClickEdit.emit(entry);
    };
    __decorate([
        core_1.Input(), 
        __metadata('design:type', Array)
    ], EntryListComponent.prototype, "entries", void 0);
    __decorate([
        core_1.Output(), 
        __metadata('design:type', Object)
    ], EntryListComponent.prototype, "emitClickEdit", void 0);
    EntryListComponent = __decorate([
        core_1.Component({
            selector: 'entry-list',
            template: "\n\n    <div class=\"buttons row\">\n      <a class=\"btn col m4\" (click)=\"setFilter('allEntries')\">All Entries</a>\n      <a class=\"btn col m4\" (click)=\"setFilter('highCalorie')\">High Calorie</a>\n      <a class=\"btn col m4\" (click)=\"setFilter('lowCalorie')\">Low Calorie</a>\n    </div>\n    <ul class=\"collection with-header\">\n      <li class=\"collection-header teal-text\">\n        Entries\n        <span class=\"secondary-content\">\n           Calories\n        </span>\n      </li>\n      <li class=\"collection-item anchor\" *ngFor=\"let entry of entries | calories:caloriesFilter\">\n        <span>{{entry.name}} - </span><span class=\"blue-grey-text\">{{entry.details}}</span>\n        <span class=\"secondary-content\">\n           {{entry.calories}}\n        </span>\n        \n          <div class=\"fixed-action-btn absolute left-button\">\n            <a class=\"btn-floating btn-small waves-effect waves-light blue-grey\" (click)=\"clickEdit(entry)\"><i class=\"material-icons\">mode_edit</i></a>\n          </div>\n      </li>\n    </ul>"
        }), 
        __metadata('design:paramtypes', [])
    ], EntryListComponent);
    return EntryListComponent;
}());
exports.EntryListComponent = EntryListComponent;
//# sourceMappingURL=entry-list.component.js.map