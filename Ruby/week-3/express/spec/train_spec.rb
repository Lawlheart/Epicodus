require('spec_helper.rb')

describe(Train) do
  before(:each) do
    @l_train = Train.new({:name => "L"})
    @a_train = Train.new({:name => "A"})
    @b_train = Train.new({:name => "B"})
  end
  
  describe('#intialize') do
    it('add attributes to class') do
      expect(@l_train.name).to eq('L')
    end
  end

  describe('.all') do
    it('starts off with no trains') do
      expect(Train.all()).to eq([])
    end
  end

  describe('#==') do
    it('treats two instances with the same name as equal') do
      l_train = Train.new({:name => "L"})
      expect(@l_train).to eq(l_train)
    end
  end

  describe('#save') do
    it('will add an id to the Train') do
      @l_train.save()
      expect(@l_train.id.class).to eq(Fixnum)
    end
    it('will save the city to the database') do
      @l_train.save()
      expect(Train.all).to eq([@l_train])
    end
  end

  describe('#update') do
    it('lets you update a city in the database') do
      @l_train.save()
      @l_train.update({:name => "C"})
      expect(@l_train.name).to eq("C")
      expect(Train.find(@l_train.id).name).to eq("C")
    end
  end

  describe('#delete') do
    it('lets you delete a city in the database') do
      @l_train.save()
      expect(Train.all).to eq([@l_train])
      @l_train.delete()
      expect(Train.all).to eq([])
    end
  end

  describe('.find') do
    it('lets you search for a city by id') do
      @l_train.save
      @a_train.save
      @b_train.save
      expect(Train.find(@l_train.id)).to eq(@l_train)
    end
  end
end
