require('pry')
require("rspec")
require('triangle')

describe(Triangle) do
  describe('#type') do
    it('Identifies invalid triangles') do
      test_triangle = Triangle.new(2, 10, 1)
      expect(test_triangle.type).to eq('not a triangle')
    end
    it('Identifies invalid triangles') do
      test_triangle = Triangle.new(8, 10, 4)
      expect(test_triangle.type).not_to eq('not a triangle')
    end
    it('Identifies an equilateral triangle') do
      test_triangle = Triangle.new(4, 4, 4)
      expect(test_triangle.type).to eq('equilateral')
    end
    it('Identifies an isosceles triangle') do
      test_triangle = Triangle.new(4, 4, 7)
      expect(test_triangle.type).to eq('isosceles')
    end
    it('Identifies a scalene triangle') do
      test_triangle = Triangle.new(4, 5, 7)
      expect(test_triangle.type).to eq('scalene')
    end
  end
end
