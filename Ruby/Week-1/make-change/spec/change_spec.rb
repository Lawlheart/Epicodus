require('rspec')
require('change')

describe('Fixnum#change') do
  it('gives correct change with pennies') do
    expect(4.change).to(eq({:Quarters => 0, :Dimes => 0, :Nickels => 0, :Pennies => 4}))
  end

  it('gives correct change with pennies and nickels') do
    expect(6.change).to(eq({:Quarters => 0, :Dimes => 0, :Nickels => 1, :Pennies => 1}))
  end
  it('gives correct change with pennies and dimes') do
    expect(14.change).to(eq({:Quarters => 0, :Dimes => 1, :Nickels => 0, :Pennies => 4}))
  end
  it('gives correct change with pennies and quarters') do
    expect(53.change).to(eq({:Quarters => 2, :Dimes => 0, :Nickels => 0, :Pennies => 3}))
  end
  it('gives correct change for all coins') do
    expect(42.change).to(eq({:Quarters => 1, :Dimes => 1, :Nickels => 1, :Pennies => 2}))
  end
end
