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
        this.recipes = [
            new Recipe("Aussie Meat Pie", [
                "1 tablespoon olive oil",
                "1 large brown onion, finely chopped",
                "500g lean beef mince",
                "1 tablespoon cornflour",
                "3/4 cup Campbell's Real Stock Beef",
                "3/4 cup tomato sauce",
                "2 tablespoons Worcestershire sauce",
                "1 tablespoon barbecue sauce",
                "1 teaspoon Vegemite",
                "2 sheets frozen shortcrust pastry, thawed",
                "2 sheets frozen puff pastry, thawed",
                "1 egg, beaten"
            ], [
                "Heat oil in a saucepan over medium-high heat. Add onion. Cook for 3 minutes or until soft. Add mince. Cook for 4 minutes, stirring with a wooden spoon, or until browned.",
                "Mix cornflour and 1 tablespoon of stock to form a paste. Add remaining stock. Add stock, sauces and Vegemite to mince. Bring to the boil. Reduce heat to medium-low. Simmer for 8 minutes or until thick. Cool.",
                "Preheat oven to 220°C. Place a baking tray into oven. Grease 4 x 8cm base measurement pie pans.",
                "Cut 4 x 15cm circles from shortcrust pastry. Use to line bases and sides of pans. Fill with mince. Brush rims with water. Cut 4 x 15cm circles from puff pastry. Place over meat. Press to seal. Trim. Brush with egg. Season.",
                "Place pies onto hot tray. Bake for 20 to 25 minutes or until golden. Serve"
            ])
        ];
    }
    AppComponent = __decorate([
        core_1.Component({
            selector: 'my-app',
            template: "\n  <div class=\"container\">\n    <h1>Recipe List</h1>\n    <div class=\"recipes\">\n      <div *ngFor=\"let recipe of recipes\"\n            class=\"recipe card  white-text indigo\">\n        <div class=\"card-content row\">\n          <span class=\"card-title col m12\">{{recipe.title}}</span>\n          <div class=\"col m5\">\n            <h5>Ingredients</h5>\n            <ul class=\"ingredients\">\n              <li *ngFor=\"let ingredient of recipe.ingredients\" \n                  class=\"ingredient\">{{ingredient}}</li>\n            </ul>\n          </div>\n          <div class=\"col m7\">\n            <h5>Directions</h5>\n            <ul class=\"directions\">\n              <li *ngFor=\"let direction of recipe.directions\" \n                  class=\"direction\">{{direction}}</li>\n            </ul>\n          </div>\n        </div>\n      </div>\n    </div>\n  </div>\n  "
        }), 
        __metadata('design:paramtypes', [])
    ], AppComponent);
    return AppComponent;
}());
exports.AppComponent = AppComponent;
var Recipe = (function () {
    function Recipe(title, ingredients, directions) {
        this.title = title;
        this.ingredients = ingredients;
        this.directions = directions;
    }
    return Recipe;
}());
exports.Recipe = Recipe;
//# sourceMappingURL=app.component.js.map