import { Injectable } from '@angular/core';
import { FirebaseListObservable, AngularFire } from "angularfire2";

@Injectable()
export class DeveloperService {
  developers: FirebaseListObservable<any[]>;

  constructor(private angularFire: AngularFire) {
    this.developers = angularFire.database.list('developers');
  }

  getDevs(role) {
    if(role) return this.angularFire.database.list('developers', {query: {
      orderByChild: 'role', equalTo: role
    }});
    return this.developers;
  }

  getDeveloperById(key: string) {
    return this.angularFire.database.object('/developers/' + key);
  }

  saveDeveloper(newDeveloper) {
    this.developers.push(newDeveloper);
  }

  deleteDeveloper(developer) {
    this.getDeveloperById(developer.$key).remove();
  }

  update(developer: any) {
    this.getDeveloperById(developer.$key).update({
      name: developer.name || '',
      role: developer.role || '',
      github: developer.github || '',
      avatar: developer.avatar || '',
      portfolio: developer.portfolio || '',
      languages: developer.languages || [""]
    });
  }
}
