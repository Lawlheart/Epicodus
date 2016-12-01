class Dealership
  @@dealerships = []
  attr_reader :name, :id, :cars

  define_method(:initialize) do |name|
    @name = name
    @id = @@dealerships.length + 1
    @cars = []
  end

  define_singleton_method(:all) do
    @@dealerships
  end

  define_method(:save) do
    @@dealerships.push(self)
  end

  define_singleton_method(:clear) do
    @@dealerships = []
  end

  define_singleton_method(:find) do |id|
    found_dealership = nil
    @@dealerships.each() do |dealership|
      if dealership.id.eql? id
        found_dealership = dealership
      end
    end
    found_dealership
  end

  define_method(:add_vehicle) do |vehicle|
    @cars.push(vehicle)
  end
end
