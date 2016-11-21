require('rspec')
require('leap_year')

describe('Fixnum#leap_year?') do
  it('Will return false if the year is NOT divisible by 4') do
    expect(1993.leap_year?).to(eq(false))
  end
  it('Will return true if the year is divisible by 4, but not 100') do
    expect(1992.leap_year?).to(eq(true))
    expect(2004.leap_year?()).to(eq(true))
  end
  it('Will return false if the year is divisible by 100, but not 400') do
    expect(1900.leap_year?).to(eq(false))
  end
  it('Will return true if the year is divisible by 400') do
    expect(2000.leap_year?).to(eq(true))
  end
end