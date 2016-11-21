require('rspec')
require('numberword')

describe('Fixnum#numberword') do
  it('returns a string') do
    expect(12.numberword.class).to(eq(String))
  end

  it('should return "nine" for the number 9') do
    expect(9.numberword).to(eq('nine'))
  end

  it('should return "twelve" for the number 12') do
    expect(12.numberword).to(eq("twelve"))
  end

  it('should return "fifty" for the number 50') do
    expect(50.numberword).to(eq("fifty"))
  end

  it('should return "nintety nine" for the number 99') do
    expect(99.numberword).to(eq("ninety nine"))
  end
  it('should return "one hundred twenty three" for 123') do
    expect(123.numberword).to(eq("one hundred twenty three"))
  end
  it('should return "one thousand twenty two" for the number 1022') do
    expect(1022.numberword).to(eq("one thousand twenty two"))
  end
  it('should return "nine hundred thousand ninety nine" for 900099') do
    expect(900099.numberword).to(eq("nine hundred thousand ninety nine"))
  end
  it('should return "one trillion" for 1000000000000') do
    expect(1000000000000.numberword).to(eq("one trillion"))
  end
  it('should return "nine hundred ninety nine trillion nine hundred ninety nine billion nine hundred ninety nine million nine hundred ninety nine thousand nine hundred ninety nine" for 999,999,999,999,999') do
    expect(999999999999999.numberword).to(eq("nine hundred ninety nine trillion nine hundred ninety nine billion nine hundred ninety nine million nine hundred ninety nine thousand nine hundred ninety nine"))
  end
end

describe('String#wordnumber') do
  it('returns a number with a valid string') do
    expect("nine".wordnumber.class).to(eq(Fixnum))
  end
end
