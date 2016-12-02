class Phone
  attr_reader :area_code, :number, :type
  define_method(:initialize) do |attrs|
    @area_code = attrs.fetch(:area_code)
    @number = attrs.fetch(:number)
    @type = attrs.fetch(:type)
  end
end