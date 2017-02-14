import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { Developer } from "../models/developer.model";
import { DeveloperService } from "../services/developer.service";

@Component({
  selector: 'new-member',
  templateUrl: './new-member.component.html',
  styleUrls: ['new-member.component.scss'],
  providers: [DeveloperService]
})
export class NewMemberComponent implements OnInit {
  displayForm: boolean = false;
  constructor(private developerService: DeveloperService) { }

  ngOnInit() {
  }

  sendNewMember(name, role, github, avatar, portfolio, languages) {
    let newLanguages = languages.split(",").map(l => l.trim());
    let newMember = new Developer(name, role, github, avatar, portfolio, newLanguages);
    this.developerService.saveDeveloper(newMember);
    this.displayForm = false;
  }

}
