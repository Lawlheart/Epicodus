
class String
  define_method(:title_case) do
    exemptions = ["nor", "but", "or", "yet", "so", "a", "an", "the", "at", "around", "by", "after", "along", "for", "from", "of", "on", "to", "with", "without", "and"]
    split(" ").map.with_index { |word, index|
      if index == 0 or !exemptions.include?(word)
        word.capitalize
      else
        word.downcase
      end
    }.join(" ")
  end
end
