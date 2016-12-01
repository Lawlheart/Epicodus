class Triangle
  define_method(:initialize) do |side1, side2, side3|
    @sides = [side1, side2, side3].sort
  end
  define_method(:type) do
    if @sides[0] + @sides[1] < @sides[2]
      'not a triangle'
    elsif @sides.first == @sides.last
      'equilateral'
    elsif @sides[0] == @sides[1] or @sides[1] == @sides[2]
      'isosceles'
    else
      'scalene'
    end

  end
end
