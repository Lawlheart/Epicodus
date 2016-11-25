class Rectangle
  define_method(:initialize) do |length, width|
    @length = length
    @width = width
  end
  define_method(:square?) do
    @length == @width
  end
  define_method(:length) do
    @length
  end
  define_method(:width) do
    @width
  end
end
