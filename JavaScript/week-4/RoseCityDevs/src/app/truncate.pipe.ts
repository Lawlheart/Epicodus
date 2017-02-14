import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'truncate'
})
export class TruncatePipe implements PipeTransform {

  transform(str: string, length: number): any {
    return str.length > length ? str.slice(0, length) + '...' : str;
  }

}
