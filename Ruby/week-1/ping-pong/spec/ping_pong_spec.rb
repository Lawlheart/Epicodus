require('rspec')
require('ping_pong')

describe('Fixnum#ping_pong') do
  it('Returns an array of numbers 1 to 2') do
    expect(2.ping_pong).to(eq([1, 2]))
  end

  it('Returns ping for multiples of 3') do
    expect(4.ping_pong).to(eq([1, 2, "ping", 4]))
  end
  it('Returns pong for multiples of 5') do
    expect(6.ping_pong).to(eq([1, 2, "ping", 4, "pong", "ping"]))
  end
  it('Returns pingpong for multiples of 3 and 5') do
    expect(15.ping_pong).to(eq([1,2,"ping",4,"pong","ping",7,8,"ping","pong",11,"ping",13,14,"pingpong"]))
  end

end
