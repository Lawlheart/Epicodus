class String
  define_method(:title_case) do
    split.each(&:capitalize!).join(" ")
  end
end