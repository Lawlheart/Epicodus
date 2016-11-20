require('rspec')
require('anagrams')

describe('String#anagrams') do
  it('returns the right data type') do
    expect("cat".anagrams(["a", "b"]).class).to(eq(Array))
  end

  it('returns all words that are anagrams') do
    expect("cat".anagrams(["cat"])).to(eq(["cat"]))
  end

  it('returns an empty array if no words are anagrams') do
    expect("hello".anagrams(["cat", "lego", "ruby"])).to(eq([]))
  end

  it('returns an array with two items if two words match') do
    expect("arches".anagrams(["chaser", "alpha", "search"])).to(eq(["chaser", "search"]))
  end
end
