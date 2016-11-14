require('rspec')
require('queen_attack')

describe('Array#queen_attack?') do
  it('is false if the coordinates are not horizontally, vertically, or diagonally in line with each other') do
    expect([1,1].queen_attack?([2,3])).to(eq(false))
  end
  it('hits things vertically') do
    expect([1,1].queen_attack?([1,4])).to(eq(true))
  end
  it('hits things horizontally') do
    expect([1,1].queen_attack?([4,1])).to(eq(true))
  end
  it('hits things horizonally') do
    expect([1,1].queen_attack?([3,3])).to(eq(true))
  end
end
