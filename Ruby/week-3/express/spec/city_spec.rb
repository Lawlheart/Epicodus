require('spec_helper.rb')

describe(City) do
  before(:each) do
    @seattle = City.new({:name => "Seattle"})
    @portland = City.new({:name => "Portland"})
    @eugene = City.new({:name => "Eugene"})
  end
  describe('#intialize') do
    it('add attributes to class') do

      expect(@seattle.name).to eq('Seattle')
    end
  end
  describe('.all') do
    it('starts off with no cities') do
      expect(City.all()).to eq([])
    end
  end
  describe('#==') do
    it('treats two instances with the same name as equal') do
      seattle = City.new({:name => "Seattle"})
      expect(@seattle).to eq(seattle)
    end
  end
  describe('#save') do
    it('will add an id to the City') do
      @seattle.save()
      expect(@seattle.id.class).to eq(Fixnum)
    end
    it('will save the city to the database') do
      @seattle.save()
      expect(City.all).to eq([@seattle])
    end
  end
  describe('#update') do
    it('lets you update a city in the database') do
      @seattle.save()
      @seattle.update({:name => "Seattle, WA"})
      expect(@seattle.name).to eq("Seattle, WA")
      expect(City.find(@seattle.id).name).to eq("Seattle, WA")
    end
  end
  describe('#delete') do
    it('lets you delete a city in the database') do
      @seattle.save()
      expect(City.all).to eq([@seattle])
      @seattle.delete()
      expect(City.all).to eq([])
    end
  end
  describe('.find') do
    it('lets you search for a city by id') do
      @seattle.save
      @portland.save
      @eugene.save
      expect(City.find(@seattle.id)).to eq(@seattle)
    end
  end
end
