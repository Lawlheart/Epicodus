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
var AppComponent = (function () {
    function AppComponent() {
        this.currentFocus = 'Angular Homework';
        this.currentTime = new Date();
        this.month = this.currentTime.getMonth() + 1;
        this.day = this.currentTime.getDate();
        this.year = this.currentTime.getFullYear();
        this.tasks = [
            new Task("Finish weekend Angular homework for Epicodus course"),
            new Task('Begin brainstorming possible JavaScript group projects'),
            new Task('Add README file to last few Angular repos on GitHub')
        ];
    }
    AppComponent = __decorate([
        core_1.Component({
            selector: 'app-root',
            template: "\n  <div class=\"container\">\n    <h1>To Do List for {{month}}/{{day}}/{{year}}</h1>\n    <h3>{{currentFocus}}</h3>\n    <ul>\n      <li *ngFor=\"let task of tasks\">{{task.description}}</li>\n    </ul>\n  </div>\n  "
        }), 
        __metadata('design:paramtypes', [])
    ], AppComponent);
    return AppComponent;
}());
exports.AppComponent = AppComponent;
var Task = (function () {
    function Task(description) {
        this.description = description;
        this.done = false;
    }
    return Task;
}());
exports.Task = Task;
//# sourceMappingURL=app.component.js.map