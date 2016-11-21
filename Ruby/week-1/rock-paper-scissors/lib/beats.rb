class String
  define_method(:beats?) do |p2|
    p1 = self
    if (p1 == 'rock' and p2 =='scissors') or (p1 =='paper' and p2 == 'rock') or (p1 == 'scissors' and p2 =='paper')
      true
    elsif (p1 =='rock' and p2 =='paper') or p1 == p2 or (p1 == 'paper' and p2 == 'scissors') or (p1 == 'scissors' and p2 == 'rock') 
      false
    end
  end
end
