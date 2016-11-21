class Fixnum
  define_method(:abs) do
    if self >= 0
      self
    else
      -1 * self
    end
  end
end

puts "Absolute valoue of -5? #{-5.abs}"


class String
  define_method(:capitalize_vowels) do
    vowels = %w(a e i o u)
    new_letters = []
    self.chars.each do |letter|
      if vowels.include?(letter)
        new_letters.push(letter.upcase)
      else
        new_letters.push(letter)
      end
    end
    new_letters.join
  end
end

puts "'ilovekittens' with vowels capitalized? #{'ilovekittens'.capitalize_vowels}"

class String
  define_method(:starts_with_a_vowel?) do
    %w(a e i o u).include?(self.chars.first)
  end
end

puts "apple starts with a vowel? #{'apple'.starts_with_a_vowel?}"

class Fixnum
  define_method(:absolutely_larger) do
    if self >= 0
      return self + 1
    else
      return self - 1
    end
  end
end

puts "Abolutely larger than 5? #{5.absolutely_larger}"
puts "Abolutely larger than -3? #{-3.absolutely_larger}"

class Fixnum
  define_method(:can_drink_alcohol) do
    self >= 21
  end
end

puts "18 year old can drink? #{18.can_drink_alcohol}"
puts "24 year old can drink? #{24.can_drink_alcohol}"

class Fixnum
  define_method(:has_two_digits) do
    self.abs > 9 && self.abs < 100
  end
end

puts "42 has 2 digits: #{42.has_two_digits}"
puts "100 has 2 digits: #{101.has_two_digits}"

