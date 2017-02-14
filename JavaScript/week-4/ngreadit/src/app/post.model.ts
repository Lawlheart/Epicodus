import { Note } from './note.model';

export class Post {
  public notes: Note[] = [];
  constructor(
    public board: string,
    public title: string,
    public author: string,
    public content: string
  ) {};
}
