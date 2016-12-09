require('spec_helper')

describe(Animal) do
  before :each do
    @bugs = Animal.new({
      :name => "Bugs",
      :type => "Bunny",
      :breed => "Mutant",
      :gender => "Male",
      :date => "2016-01-01"
    })

    @daffy = Animal.new({
      :name => "Daffy",
      :type => "Duck",
      :breed => "Mutant",
      :gender => "Male",
      :date => "2016-12-22"
    })

    @taz = Animal.new({
      :name => "Taz",
      :type => "Tazmanian Devil",
      :breed => "Red Bull",
      :gender => "Male",
      :date => "2016-03-12"
    })

    @porky = Animal.new({
      :name => "Porky",
      :type => "Pig",
      :breed => "Bacon",
      :gender => "Male",
      :date => "2016-05-23"
    })
  end

  describe '#initialize' do
    it 'initializes basic properties' do
      expect(@bugs.name).to eq "Bugs"
      expect(@bugs.type).to eq "Bunny"
      expect(@bugs.breed).to eq "Mutant"
      expect(@bugs.gender).to eq "Male"
    end
  end

  describe '#save' do
    it "will save the into the database" do
      @bugs.save()
      expect(Animal.all).to be_an_instance_of(Array)
    end

    it "will update animals that already exist" do
      @bugs.save
      @bugs.save
      bugs2_id = @bugs.id
      expect(Animal.all.first).to eq @bugs
      expect(Animal.all.first.id.to_i).to eq bugs2_id
    end
  end

  describe '.all' do
    it "will list out all animals in the database" do
      @bugs.save()
      expect(Animal.all).to eq [@bugs]
    end
  end

  describe '#==' do
    it "will return false if and of the name, breed, type, or gender don't match" do
      expect(@bugs == @daffy).to eq false
    end
  end

  describe '.all_sorted_by' do
    it "will return a sorted list of animals given a valid argument" do
      @bugs.save
      @daffy.save
      @taz.save
      @porky.save
      expect(Animal.all_sorted_by("name")).to eq [@bugs, @daffy, @porky, @taz]
      expect(Animal.all_sorted_by("type")).to eq [@bugs, @daffy, @porky, @taz]
      expect(Animal.all_sorted_by("breed")).to eq [@porky, @bugs, @daffy, @taz]
      expect(Animal.all_sorted_by("date")).to eq [@bugs, @taz, @porky, @daffy]
    end
  end


  describe '.adopted_by' do
    it "add a owner to a pet" do
      @kevin = Person.new({:name => "Kevin", :phone => '406-555-5678', :type_pref => 'dog', :breed_pref => 'labs'})
      @bugs.save
      @bugs.adopted_by(@kevin)
      expect(@bugs.person_id).to eq @kevin.id
    end
  end
end
