import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { FirebaseObjectObservable } from "angularfire2";
import { DeveloperService } from "../services/developer.service";

@Component({
  selector: 'edit-member',
  templateUrl: './edit-member.component.html',
  styleUrls: ['edit-member.component.scss'],
  providers: [DeveloperService]
})
export class EditMemberComponent implements OnInit {
  @Input() developer: FirebaseObjectObservable<any>;
  @Output() finishEditingSender = new EventEmitter();

  constructor(private developerService: DeveloperService) { }

  ngOnInit() {
  }

  updateMember(developer) {
    console.log(developer.$key)
    this.developerService.update(developer);
    this.finishEditingSender.emit();
  }
}
