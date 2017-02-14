import { Component, OnInit } from '@angular/core';
import { Note } from '../note.model';
import { Post } from '../post.model';

@Component({
  selector: 'app-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.css']
})
export class IndexComponent {
  public board = "Random";
  addPost = false;
  editingPost = null;
  public boardList = [
    "Random",
    "Games"
  ];

  posts: Post[] = [
    (() => {
      let post = new Post("Random", "Hello World", "admin", "Obligatory hello world post");
      post.notes.push(new Note("Hello Back", "user"));
      return post;
    })(),
    new Post("Random", "Hello World Part 2", "admin", "Even more hello, more world!"),
  ];

  setBoard(board) {
    this.board = board;
  }

  showAddForm(){
    this.addPost = true;
  }
  createPost(newPost) {
    this.posts.push(newPost);
    this.addPost = false;
  }
  showEditForm(post) {
    this.editingPost = post;
  }

  doneEditing() {
    this.editingPost = null;
  }

  deletePost(postToDelete) {
    this.posts = this.posts.filter(function(post) {
      return JSON.stringify(post) !== JSON.stringify(postToDelete);
    });
  }
}
