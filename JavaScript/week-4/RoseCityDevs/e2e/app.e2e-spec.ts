import { RoseCityDevsPage } from './app.po';

describe('rose-city-devs App', function() {
  let page: RoseCityDevsPage;

  beforeEach(() => {
    page = new RoseCityDevsPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
