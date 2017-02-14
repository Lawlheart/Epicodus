import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'roleFilter'
})
export class RoleFilterPipe implements PipeTransform {

  transform(developers: any, role): any {
    console.log(developers);
    return developers.subscribe(devs => devs.filter(dev => dev.role === role));
  }

}
