import { Component, Input, Output, EventEmitter} from '@angular/core';
import { Post } from '../post.model';

@Component({
  selector: 'edit-post',
  templateUrl: './edit-post.component.html',
  styleUrls: ['./edit-post.component.css']
})
export class EditPostComponent {
  @Input() post: Post;
  @Output() doneEditSender = new EventEmitter();

  doneEditing() {
    this.doneEditSender.emit();
  }

}
