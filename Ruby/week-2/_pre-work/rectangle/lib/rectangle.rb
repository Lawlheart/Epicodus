class Rectangle
  define_method(:initialize) do |height, width|
    @height = height
    @width = width
  end
  define_method(:square?) do
    @height == @width
  end
end
