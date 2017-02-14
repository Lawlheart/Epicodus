import { Component, OnInit } from '@angular/core';
import { FirebaseListObservable } from "angularfire2";
import { DeveloperService } from "../services/developer.service";

@Component({
  selector: 'app-members',
  templateUrl: './members.component.html',
  styleUrls: ['members.component.scss'],
  providers: [DeveloperService]
})
export class MembersComponent implements OnInit {
  developers: FirebaseListObservable<any[]>;
  currentRole: string = "";
  roles: string[] = ['Full Stack Developer', 'Front End Developer', 'Web Developer'];
  constructor(private developerService: DeveloperService) { }

  ngOnInit() {
    this.developers = this.developerService.getDevs(this.currentRole);
  }

  filterDevs(role) {
    this.currentRole = role;
    this.developers = this.developerService.getDevs(this.currentRole);
  }

  getActive(role) {
    return role === this.currentRole ? 'active' : '';
  }
}
