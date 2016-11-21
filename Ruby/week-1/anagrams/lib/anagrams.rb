class String
  define_method(:make_letter_hash) do
    word = self
    key = {}
    ("a".."z").each do |letter|
      key.store(letter.to_sym, word.count(letter.downcase))
    end
    key
  end

  define_method(:anagrams) do |word_list|
    cypher = self
    word_list.keep_if do |word|
      cypher.make_letter_hash == word.make_letter_hash
    end
  end
end
