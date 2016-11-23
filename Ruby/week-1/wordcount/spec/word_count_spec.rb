require('rspec')
require('word_count')

describe('String#word_count') do
  it('returns an integer') do
    expect("hello world".word_count("hello").class).to be(Fixnum)
  end
  it('gets counts for whole words') do
    expect("If Peter Piper picked a peck of pickled peppers, where's the peck of pickled peppers Peter Piper picked?".word_count("peck")).to eq(2)
  end
  it('accounts for matches regardless of case') do
    expect("HELLO WORLD!".word_count("hello")).to eq(1)
  end
  it('accounts for punctuation') do
    expect("")
  end
end

describe('String#word_count_partials') do
  it('returns an integer') do
    expect("hello world".word_count_partials("hello").class).to be(Fixnum)
  end
  it('still gets counts for whole words') do
    expect("If Peter Piper picked a peck of pickled peppers, where's the peck of pickled peppers Peter Piper picked?".word_count_partials("peck")).to eq(2)
  end
  it('accounts for partial matches') do
    expect("If Peter Piper picked a peck of pickled peppers, where's the peck of pickled peppers Peter Piper picked?".word_count_partials("pick")).to eq(4)
  end
  it('gives one match per matching word regardless of repetition inside of the work') do
    expect("banana".word_count_partials("na")).to be(1)
  end
  it('matches partials with many matches') do
    expect("Something in a thirty-acre thermal thicket of thorns and thistles thumped and thundered threatening the three-D thoughts of Matthew the thug - although, theatrically, it was only the thirteen-thousand thistles and thorns through the underneath of his thigh that the thirty year old thug thought of that morning.".word_count_partials("th")).to eq(31)
  end
end