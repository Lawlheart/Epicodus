class String
  define_method(:leetspeak) do
    split("").map.with_index { |l, i|
      if l.downcase == 'e'
        3
      elsif l.downcase == 'o'
        0
      elsif l == 'I'
        1
      elsif l.downcase=='s' and i > 0 and self[i-1] != " "
        "z"
      else
        l
      end
    }.join("")
  end
end
