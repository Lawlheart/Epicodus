import {Pipe, PipeTransform} from '@angular/core';
import {Entry} from './entry.model';

@Pipe({
  name: "calories",
  pure: false
})


export class CaloriesPipe implements PipeTransform {
  transform(input: Entry[], filter) {
    if(filter ==='highCalorie') {
      return input.filter( entry => entry.calories >= 500);
    } else if(filter ==='lowCalorie') {
      return input.filter( entry => entry.calories < 500);
    } else {
      return input;
    }
  }
}