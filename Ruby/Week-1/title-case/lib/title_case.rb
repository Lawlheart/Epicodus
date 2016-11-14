class String
  define_method(:title_case) do
    split(" ").map { |word| word.capitalize }.join(" ")
  end
end
