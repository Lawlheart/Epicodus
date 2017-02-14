import { Component, OnInit, Output, Input, EventEmitter } from '@angular/core';
import { Post } from '../post.model';

@Component({
  selector: 'post-list',
  templateUrl: './post-list.component.html',
  styleUrls: ['./post-list.component.css']
})
export class PostListComponent {
  @Input() posts: Post[];
  @Output() editPostFormSender = new EventEmitter();
  @Output() deletePostSender = new EventEmitter();

  showEditForm(post) {
    this.editPostFormSender.emit(post);
  }
  deletePost(post) {
    this.deletePostSender.emit(post);
  }
}
