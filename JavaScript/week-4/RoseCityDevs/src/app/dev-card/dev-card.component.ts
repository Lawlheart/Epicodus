import { Component, OnInit, Input } from '@angular/core';
import { Router } from "@angular/router";

@Component({
  selector: 'dev-card',
  templateUrl: './dev-card.component.html',
  styleUrls: ['dev-card.component.scss']
})
export class DevCardComponent implements OnInit {
  @Input() developer;

  constructor(private router: Router) {
  }

  ngOnInit() {
  }

  link(url) {
    window.open(url);
  }

  goToProfile(key) {
    this.router.navigate(['profile', key]);
  }

}
