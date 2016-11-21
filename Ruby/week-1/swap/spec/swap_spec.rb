require('rspec')
require('swap')

describe('String#swap') do
  it('returns a string') do
    expect("abc".swap("a", "z").class).to(eq(String))
  end
  it('replaces whole words') do
    expect("hello world".swap("world", "mars")).to(eq("hello mars"))
  end
  it('replaces partial words') do
    expect("it went to the cathedral".swap("cat", "dog")).to(eq("it went to the doghedral"))
  end
end
