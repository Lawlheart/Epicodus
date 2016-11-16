require('rspec')
require('scrabble')


describe('String#scrabble') do
  it('returns a number') do
    expect("a".scrabble.class).to(eq(Fixnum))
  end
  it('returns a scrabble score for a letter') do
    expect("a".scrabble).to(eq(1))
  end
  it('returns the correct scrabble score for d') do
    expect("d".scrabble).to(eq(2))
  end
  it('returns the score for the letter B') do
    expect("b".scrabble).to(eq(3))
  end
  it('returns the correct scores for Q') do
    expect("Q".scrabble).to(eq(10))
  end
  it('returns the correct scores for Z') do
    expect("Z".scrabble).to(eq(10))
  end
  it('returns the correct score regardless of letter case') do
    expect("a".scrabble).to(eq(1))
    expect("A".scrabble).to(eq(1))
  end
end
