require('rspec')
require('title_case')

describe('String#title_case') do
  it('capitalizes the first letter of a word') do
    expect("beowulf".title_case).to(eq("Beowulf"))
  end
  it('capitalizes the first letter of all words in a multiple word title') do
    expect("the color purple".title_case).to(eq("The Color Purple"))
  end
end