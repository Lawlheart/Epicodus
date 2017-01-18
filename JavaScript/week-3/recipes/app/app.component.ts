import { Component } from '@angular/core';

@Component({
  selector: 'my-app',
  template: `
  <div class="container">
    <h1>Recipe List</h1>
    <div class="recipes">
      <div *ngFor="let recipe of recipes"
            class="recipe card  white-text indigo">
        <div class="card-content row">
          <span class="card-title col m12">{{recipe.title}}</span>
          <div class="col m5">
            <h5>Ingredients</h5>
            <ul class="ingredients">
              <li *ngFor="let ingredient of recipe.ingredients" 
                  class="ingredient">{{ingredient}}</li>
            </ul>
          </div>
          <div class="col m7">
            <h5>Directions</h5>
            <ul class="directions">
              <li *ngFor="let direction of recipe.directions" 
                  class="direction">{{direction}}</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  `
})

export class AppComponent {
  recipes: Recipe[] = [
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
  ]
}

export class Recipe {
  constructor(
      public title: string,
      public ingredients: string[],
      public directions: string[]
  ) { }
}