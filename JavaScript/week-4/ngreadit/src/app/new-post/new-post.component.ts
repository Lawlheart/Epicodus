import { Component, Output, Input, EventEmitter } from '@angular/core';
import { Post } from '../post.model';

@Component({
  selector: 'new-post',
  templateUrl: './new-post.component.html',
  styleUrls: ['./new-post.component.css']
})
export class NewPostComponent {
  @Input() boardName: string
  @Output() newPostSender = new EventEmitter();

  submitNewPost(board, title, author, content) {
    let newPost = new Post( board, title, author, content)
    this.newPostSender.emit(newPost)

  }



}
