require('rspec')
require('leetspeak')

describe('String#leetspeak') do
  it('replaces the letter e with 3') do
    expect("help".leetspeak).to(eq('h3lp'))
  end
  it('replaces the letter o with 0') do
    expect("hello".leetspeak).to(eq('h3ll0'))
  end
  it('replaces the letters o and e regardless of case') do
    expect("HELLO".leetspeak).to(eq('H3LL0'))
  end
  it('replaces the uppercase letter i with 1') do
    expect("I like Ike".leetspeak).to(eq('1 lik3 1k3'))
  end
  it('replaces the letter s with z UNLESS it is the first letter of the word') do
    expect('sassafrass'.leetspeak).to(eq('sazzafrazz'))
  end
  it('replaces letters correctly in a string of words') do
    expect("I scream you scream we all scream for raspberry ice cream.".leetspeak).to(eq("1 scr3am y0u scr3am w3 all scr3am f0r razpb3rry ic3 cr3am."))
  end
end
