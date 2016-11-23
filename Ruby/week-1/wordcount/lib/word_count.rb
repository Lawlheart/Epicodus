class String
  define_method(:word_count) do |match|
    split(" ").keep_if{|w| w.downcase.gsub(/[^a-z ]/, '') == match.downcase}.length
  end
  define_method(:word_count_partials) do |match|
    split(" ").keep_if{|w| w.downcase.include?(match.downcase)}.length
  end
end
