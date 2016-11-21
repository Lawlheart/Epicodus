require('rspec')
require('title_case')

describe('String#title_case') do
  it('will return a string') do
    expect("hello".title_case.class).to(eq(String))
  end
  it('capitalizes first word') do
    expect("hello".title_case).to(eq("Hello"))
  end
  it('capitalizes all the words') do
    expect("hello there i'm diego".title_case).to(eq("Hello There I'm Diego"))
  end
  it('capitalizes all the words except articles, coordinating conjunctions, and prepositions') do
    expect("kenny and i both went to university of oregon".title_case).to(eq("Kenny and I Both Went to University of Oregon"))
  end
end
