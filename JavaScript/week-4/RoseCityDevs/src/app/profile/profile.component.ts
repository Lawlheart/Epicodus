import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from "@angular/router";
import { Location } from '@angular/common';
import { DeveloperService } from "../services/developer.service";

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['profile.component.scss'],
  providers: [DeveloperService]
})
export class ProfileComponent implements OnInit {
  developer: any;
  constructor(private route: ActivatedRoute, private location: Location, private developerService: DeveloperService) {}

  ngOnInit() {
    this.route.params.forEach(params => {
      this.developer = this.developerService.getDeveloperById(params['id']);
    });
  }
  githubLink() {
    this.developer.subscribe(developer => window.open('https://github.com/' + developer.github));
  }

  portfolioLink() {
    this.developer.subscribe(developer => window.open(developer.portfolio))
  }
}
