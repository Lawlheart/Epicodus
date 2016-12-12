require('spec_helper')

describe(Client) do
  before(:each) do
    @alice = Client.new({:name => "Alice"})
  end

  describe('#initialize') do
    it("creates a new client with a given name and an id of nil") do
      expect(@alice.name)
    end
  end

  describe('.all') do
    it('starts with an empty database') do
      expect(Client.all).to eq([])
    end
    it('lists all clients in the database') do
      @alice.save
      expect(Client.all).to eq([@alice])
    end
  end

  describe('#save') do
    it('saves a copy of the client to the database') do
      @alice.save
      expect(Client.all).to eq([@alice])
    end
  end

  describe('.find') do
    it('finds a client in the database, if it exists') do
      @alice.save
      expect(Client.find(@alice.id)).to eq(@alice)
    end
    it("returns nil if the client doesn't exist") do
      expect(Client.find(99999999999999999999999999999)).to eq(nil)
    end
  end

  describe('#update') do
    it('updates the data in the database') do
      @alice.save
      @alice.update({:name => "Alisha"})
      expect(@alice.name).to eq("Alisha")
      expect(Client.find(@alice.id).name).to eq("Alisha")
    end
  end

  describe('#delete') do
    it('deletes a client from the database') do
      @alice.save
      expect(Client.all).to eq([@alice])
      @alice.delete
      expect(Client.all).to eq([])
    end
  end

  describe('#stylist') do
    it('returns the stylist that the client is assigned to') do
      @sarah = Stylist.new({:name => "Sarah"}).save
      @alice.save
      @sarah.add_client(@alice)
      expect(@alice.stylist).to eq(@sarah)
    end
  end

  describe('#remove_stylist') do
    it('removes the stylist from the client') do
      @alice.save
      @sarah = Stylist.new({:name => "Sarah"}).save
      @sarah.add_client(@alice)
      expect(@alice.stylist).to eq(@sarah)
      @alice.remove_stylist
      expect(@alice.stylist_id.class).not_to eq(Fixnum)
    end
  end
end
