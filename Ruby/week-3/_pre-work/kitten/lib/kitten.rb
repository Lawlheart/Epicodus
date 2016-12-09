class Kitten
  attr_reader :name

  define_method(:initialize) do |attrs|
    @name = attrs.fetch(:name)
  end

  define_method(:==) do |other|
    self.class.eql? other.class and name.eql? other.name
  end
end