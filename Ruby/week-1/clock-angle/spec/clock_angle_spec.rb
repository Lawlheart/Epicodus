require('rspec')
require('clock_angle')

describe("String#clock_angle") do
  it('gives the distance between the minute and hour hands') do
    expect("06:00".clock_angle).to(eq(180.0))
  end
  it('gives the distance between the minute and hour hands') do
    expect("12:00".clock_angle).to(eq(0.0))
  end
  it('gives the distance between the minute and hour hands') do
    expect("07:15".clock_angle).to(eq(127.5))
  end
  it('gives the distance between the minute and hour hands') do
    expect("03:50".clock_angle).to(eq(175.0))
  end
  it('gives the distance between the minute and hour hands') do
    expect("11:59".clock_angle).to(eq(5.5))
  end
end
