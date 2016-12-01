require('rspec')
require('vehicle')

describe(Vehicle) do
  test_vehicle = Vehicle.new({:make => "Toyota", :model => "Prius", :year => 2016})
  test_vehicle2 = Vehicle.new({:make => "Toyota", :model => "Yaris", :year => 2008})

  before() do
    Vehicle.clear()
  end

  describe('#initialize') do
    it('sets the vehicle attributes') do
      expect(test_vehicle.make).to(eq("Toyota"))
      expect(test_vehicle.model).to(eq("Prius"))
      expect(test_vehicle.year).to(eq(2016))
    end
  end
  describe(".all") do
    it('returns a list of all the vehicles') do
        expect(Vehicle.all).to(eq([]))
    end
  end
  describe("#save") do
    it('saves the vehicle') do
      test_vehicle.save
      expect(Vehicle.all).to eq([test_vehicle])
    end
  end
  describe(".clear") do
    it('clears the lot') do
      expect(Vehicle.all).to eq []
    end
  end
end
