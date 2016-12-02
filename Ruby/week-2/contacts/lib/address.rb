class Address
  attr_reader :local, :city, :state, :zip, :type
  define_method(:initialize) do |attrs|
    @local = attrs.fetch(:local)
    @city = attrs.fetch(:city)
    @state = attrs.fetch(:state)
    @zip = attrs.fetch(:zip)
    @type = attrs.fetch(:type)
  end
end