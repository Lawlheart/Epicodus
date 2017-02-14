import { ReaditPage } from './app.po';

describe('readit App', function() {
  let page: ReaditPage;

  beforeEach(() => {
    page = new ReaditPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
