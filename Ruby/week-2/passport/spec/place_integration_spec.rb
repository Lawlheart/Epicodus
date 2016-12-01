require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe("the home path", {:type => :feature}) do
  it("adds locations and displays them") do
    visit("/")
    fill_in("place", :with => "Portland")
    click_button("Stamp Passport!")
    visit("/")
    expect(page).to have_content("Portland")
  end
end
