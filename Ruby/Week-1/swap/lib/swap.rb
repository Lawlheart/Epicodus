class String
  define_method(:swap) do |target, subs|
    phrase = self
    phrase = phrase.split(" ").map do |word|
      if word == target
        subs
      elsif word.include?(target)
        word.gsub(target, subs)
      else
        word
      end
    end
    phrase.join(" ")
  end
end
