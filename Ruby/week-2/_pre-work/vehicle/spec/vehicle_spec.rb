require('rspec')
require('vehicle')

describe(Vehicle) do
  describe('#age') do
    it('returns the vehicle\'s age') do
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      expect(test_vehicle.age).to eq(16)
    end
  end
  describe('#worth_buying?') do
    it('returns false if the vehicle is not american made and younger than 16 years old') do
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      expect(test_vehicle.worth_buying?).to eq(false)
    end
  end
end