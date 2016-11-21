require('rspec')
require('beats')

describe('String#beats') do
  it('returns true if rock is the object and scissors is the argument') do
    expect('rock'.beats?('scissors')).to(eq(true))
  end
  it('returns false if rock is the object and paper is the argument') do
    expect('rock'.beats?('paper')).to(eq(false))
  end
  it('returns false if rock is the object and rock is the argument') do
    expect('rock'.beats?('rock')).to(eq(false))
  end
  it('returns true if paper is the object and rock is the argument') do
    expect('paper'.beats?('rock')).to(eq(true))
  end
  it('returns false if paper is the object and scissors is the argument') do
    expect('paper'.beats?('scissors')).to(eq(false))
  end
  it('returns false if paper is the object and paper is the argument') do
    expect('paper'.beats?('paper')).to(eq(false))
  end
  it('returns true if scissors is the object and paper is the argument') do
    expect('scissors'.beats?('paper')).to(eq(true))
  end
  it('returns false if scissors is the object and rock is the argument') do
    expect('scissors'.beats?('rock')).to(eq(false))
  end
  it('returns false if scissors is the object and scissors is the argument') do
    expect('scissors'.beats?('scissors')).to(eq(false))
  end
end
