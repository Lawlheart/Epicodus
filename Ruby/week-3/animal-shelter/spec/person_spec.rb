require('spec_helper')

describe Person  do
  before :each  do
    @kenny = Person.new({:name => "Kenny", :phone => '541-555-1234'})
    @kevin = Person.new({
      :name => "Kevin",
      :phone => '406-555-5678',
      :type_pref => 'dog',
      :breed_pref => 'labs'
    })

    @brigette = Person.new({
      :name => "Brigette",
      :phone => '503-555-1232',
      :type_pref => 'cat',
      :breed_pref => 'siberian'
    })

    @alis = Person.new({
      :name => "Alis",
      :phone => '503-555-5678',
      :type_pref => 'dog',
      :breed_pref => 'labs'
    })
  end
  
  describe '#initialize'  do
    it "will return name and phone" do
      expect(@kenny.name).to eq "Kenny"
      expect(@kenny.phone).to eq '541-555-1234'
    end

    it "will initialize id, type and breed preferences as nil if not supplied" do
      expect(@kenny.id).to eq nil
      expect(@kenny.type_pref).to eq nil
      expect(@kenny.breed_pref).to eq nil
    end

    it "will initialize breed preferences properly if provided" do
      expect(@kevin.type_pref).to eq "dog"
      expect(@kevin.breed_pref).to eq "labs"
    end
  end

  describe '#save' do
    it "will save the into the database" do
      @kenny.save()
      expect(Person.all).to be_an_instance_of(Array)
    end

    it "will update entries that already exist" do
      @kevin.save
      @kevin.save
      person2_id = @kevin.id
      expect(Person.all.first).to eq @kevin
      expect(Person.all.first.id.to_i).to eq person2_id
    end
  end

  describe '.all' do
    it "will list out all animals in the database" do
      @kenny.save()
      expect(Person.all).to eq [@kenny]
    end
  end

  describe '#==' do
    it "will return false if the name or phone don't match" do
      expect(@kenny == @kevin).to eq false
    end
  end

  describe '.adoptees_for' do
    it "list customer by breed preference" do
      @fido = Animal.new({
        :name => "Fido",
        :type => "dog",
        :breed => "labs",
        :gender => "Male",
        :date => "2016-05-23"
      })
      @alis.save
      @brigette.save
      @kevin.save
      expect(Person.adoptees_for(@fido)).to eq [@alis, @kevin]
    end
  end
end
