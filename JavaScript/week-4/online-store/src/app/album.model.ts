export class Album {
  public $key: string = "";
  constructor(
    public title: string,
    public artist: string,
    public description: string
  ) {}
}
