import { Component, OnInit, Output, Input, EventEmitter } from '@angular/core';
import { Post } from '../post.model';

@Component({
  selector: 'post-detail',
  templateUrl: './post-detail.component.html',
  styleUrls: ['./post-detail.component.css']
})
export class PostDetailComponent {
  @Input() post: Post;
  @Output() editPostFormSender = new EventEmitter();
  @Output() deletePostSender = new EventEmitter();

  postVisible: boolean = false;
  notesVisible: boolean = false;

  showEditPostForm(post) {
    this.editPostFormSender.emit(post);
  }
  deletePost(post) {
    this.deletePostSender.emit(post);
  }


  togglePost() {
    this.postVisible = !this.postVisible;
  }
  toggleNotes() {
    this.notesVisible = !this.notesVisible;
  }

}
