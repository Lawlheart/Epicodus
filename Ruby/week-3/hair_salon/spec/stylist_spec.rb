require('spec_helper.rb')

describe(Stylist) do
  before(:each) do
    @sarah = Stylist.new({:name => "Sarah"})
  end

  describe('#initialize') do
    it("creates a new stylist with a given name and an id of nil") do
      expect(@sarah.name)
    end
  end

  describe('.all') do
    it('starts with an empty database') do
      expect(Stylist.all).to eq([])
    end
    it('lists all stylists in the database') do
      @sarah.save
      expect(Stylist.all).to eq([@sarah])
    end
  end

  describe('#save') do
    it('saves a copy of the stylist to the database') do
      @sarah.save
      expect(Stylist.all).to eq([@sarah])
    end
  end

  describe('.find') do
    it('finds a stylist in the database, if it exists') do
      @sarah.save
      expect(Stylist.find(@sarah.id)).to eq(@sarah)
    end
  end

  describe('#update') do
    it('updates the data in the database') do
      @sarah.save
      @sarah.update({:name => "Sara"})
      expect(@sarah.name).to eq("Sara")
      expect(Stylist.find(@sarah.id).name).to eq("Sara")
    end
  end

  describe('#delete') do
    it('deletes a stylist from the database') do
      @sarah.save
      expect(Stylist.all).to eq([@sarah])
      @sarah.delete
      expect(Stylist.all).to eq([])
    end
  end

  describe('#add_client') do
    it('adds a stylist_id to the client') do
      @sarah.save
      @alice = Client.new({:name => "Alice"}).save
      @sarah.add_client(@alice)
      expect(@alice.stylist_id).to eq(@sarah.id)
    end
  end

  describe('#clients') do
    it('returns all clients for the stylist') do
      @sarah.save
      @alice = Client.new({:name => "Alice"}).save
      @bob = Client.new({:name => "Bob"}).save
      @charlie = Client.new({:name => "Charlie"}).save

    end
  end
end
