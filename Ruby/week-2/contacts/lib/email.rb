class Email
  attr_reader :address, :type
  define_method(:initialize) do |attrs|
    @address = attrs.fetch(:address)
    @type = attrs.fetch(:type)
  end
end