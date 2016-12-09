class Stage
  define_method(:initialize) do |attrs|
    @name = attrs.fetch(:name)
    @location = attrs.fetch(:location)
    @capacity = attrs.fetch(:capacity)
  end
end