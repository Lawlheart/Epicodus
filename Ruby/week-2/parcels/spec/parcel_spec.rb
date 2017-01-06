require('pry')
require("rspec")
require('parcel')

describe(Parcel) do
  describe('#volume') do
    it('returns the volume of the parcel') do
      test_parcel = Parcel.new(2, 2, 3, 1)
      expect(test_parcel.volume()).to eq (12)
    end
  end
  describe('#cost_to_ship') do
    it('returns the cost to ship of the parcel') do
      test_parcel = Parcel.new(2, 2, 3, 1)
      expect(test_parcel.cost_to_ship("express", 200).class).to eq(Fixnum)
    end
    it('returns the cost to ship a small, local parcel') do
      test_parcel = Parcel.new(2, 2, 2, 1)
      expect(test_parcel.cost_to_ship("standard", 40)).to eq(51)
    end
    it('returns the cost to ship a large, local parcel') do
      test_parcel = Parcel.new(4, 4, 2, 1)
      expect(test_parcel.cost_to_ship("standard", 40)).to eq(57.4)
    end
    it('returns the cost to express ship a small, local parcel') do
      test_parcel = Parcel.new(2, 2, 2, 1)
      expect(test_parcel.cost_to_ship("express", 40)).to eq(151)
    end
    it('returns the cost to express ship a small, regional parcel') do
      test_parcel = Parcel.new(2, 2, 2, 1)
      expect(test_parcel.cost_to_ship("express", 200)).to eq(251)
    end
    it('returns the cost to ship something large far away') do
      test_parcel = Parcel.new(10, 10, 10, 100)
      expect(test_parcel.cost_to_ship("standard", 800)).to eq(650)
    end
  end
end
