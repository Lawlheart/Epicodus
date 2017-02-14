import { Component, OnInit } from '@angular/core';
import { DeveloperService } from "../services/developer.service";
import { FirebaseListObservable } from "angularfire2";

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['admin.component.scss'],
  providers: [DeveloperService]
})
export class AdminComponent implements OnInit {
  editingKey: string = "";
  developers: FirebaseListObservable<any[]>;
  constructor(private developerService: DeveloperService) { }

  ngOnInit() {
    this.developers = this.developerService.getDevs('');
  }

  deleteMember(developer) {
    this.developerService.deleteDeveloper(developer);
  }

}
