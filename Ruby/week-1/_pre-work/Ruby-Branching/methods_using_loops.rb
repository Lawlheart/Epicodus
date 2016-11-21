# Make an upcase! method on Array that changes the receiver.
class Array
  define_method(:upcase) do
    self.each do |item|
      item.upcase!
    end
  end
end

letters = %w(a b c d e f)
letters.upcase
puts letters


# Make a product method on Range that multiples the numbers in the range.
class Range
  define_method(:product) do
    product = 1
    self.each do |num|
      product *= num
    end
    product
  end
end

puts (1..10).product

# Make a String method called triple_each_letter().("Hello"  becomes "HHHeeellllllooo").
class String
  define_method(:triple_each_letter) do
    new_array = []
    self.chars.each do |letter|
      new_array.push(letter * 3)
    end
    new_array.join
  end
  define_method(:duplicate_each_letter) do |num|
    self.chars.map { |c| c * num }.join
  end
end

puts 'Hello'.triple_each_letter
puts 'Hello'.duplicate_each_letter(5)

