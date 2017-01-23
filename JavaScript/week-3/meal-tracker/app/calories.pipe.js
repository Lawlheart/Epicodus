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
var CaloriesPipe = (function () {
    function CaloriesPipe() {
    }
    CaloriesPipe.prototype.transform = function (input, filter) {
        if (filter === 'highCalorie') {
            return input.filter(function (entry) { return entry.calories >= 500; });
        }
        else if (filter === 'lowCalorie') {
            return input.filter(function (entry) { return entry.calories < 500; });
        }
        else {
            return input;
        }
    };
    CaloriesPipe = __decorate([
        core_1.Pipe({
            name: "calories",
            pure: false
        }), 
        __metadata('design:paramtypes', [])
    ], CaloriesPipe);
    return CaloriesPipe;
}());
exports.CaloriesPipe = CaloriesPipe;
//# sourceMappingURL=calories.pipe.js.map