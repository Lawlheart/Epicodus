class Fixnum
  define_method(:numberword) do
    ones = {
      1  => "one",
      2  => "two",
      3  => "three",
      4  => "four",
      5  => "five",
      6  => "six",
      7  => "seven",
      8  => "eight",
      9  => "nine",
      10  => "ten",
      11  => "eleven",
      12  => "twelve",
      13  => "thirteen",
      14  => "fourteen",
      15  => "fifteen",
      16  => "sixteen",
      17  => "seventeen",
      18  => "eighteen",
      19  => "nineteen"
    }
    tens = {
      2 => "twenty",
      3 => "thirty",
      4 => "fourty",
      5 => "fifty",
      6 => "sixty",
      7 => "seventy",
      8 => "eighty",
      9 => "ninety"
    }
    higher_digits = {
      2 => "thousand",
      3 => "million",
      4 => "billion",
      5 => "trillion"
    }
    # assume 3 digit number. split into threes for higher
    sentence = []
    groups = []
    digits = self.to_s
    group_count = (digits.length/3.0).ceil

    for i in 1..group_count do
      if(digits.length > 3)
        groups.push(digits.slice!(-3, 3).to_i)
      else
        groups.push(digits.to_i)
      end
    end

    groups.reverse!
    groups.each.with_index do |num, i|
      if num >= 100
        sentence.push(ones.fetch(num/100))
        sentence.push("hundred")
        num = num % 100
      end

      if num >= 20
        sentence.push(tens.fetch(num/10))
        num = num % 10
      end

      if ones.has_key?(num)
      	sentence.push(ones.fetch(num))
      end

      if i < group_count - 1 and groups[i] > 0
        group_num = group_count - i
        sentence.push(higher_digits.fetch(group_num))
      end
    end
    sentence.join(" ")
  end
end

class String
  define_method(:wordnumber) do
    ones = {
      "one" => 1,
      "two" => 2,
      "three" => 3,
      "four" => 4,
      "five" => 5,
      "six" => 6,
      "seven" => 7,
      "eight" => 8,
      "nine" => 9,
      "ten" => 10,
      "eleven" => 11,
      "twelve" => 12,
      "thirteen" => 13,
      "fourteen" => 14,
      "fifteen" => 15,
      "sixteen" => 16,
      "seventeen" => 17,
      "eighteen" => 18,
      "nineteen" => 19
    }
    phrase = self
    total = 0
  end
end

# 
# phrase = "one thousand twenty two"
# if phrase.include?("thousand")
# 	phrase.split(" thousand ")
# end
#
# cutoffs = ["trillion", "billion", "million", "thousand"]

#loop through them, split into string for each place
