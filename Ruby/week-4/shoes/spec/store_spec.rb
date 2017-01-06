require('spec_helper')

describe Store do
  describe "the many to many relationship" do
    it "should wire it up properly" do
      should have_and_belong_to_many(:brands)
    end
  end

  describe '#brands' do
    it 'lists the brands that are carried at that store' do
      store = Store.create({:name => "macys"})
      brand = Brand.create({:name => "nike"})
      store.brands.push(brand)
      expect(store.brands).to eq [brand]
    end
  end

  describe "callbacks" do
    it "should capitalize brand names" do
      store = Store.create({:name => "macys"})
      expect(store.name).to eq "Macys"
    end
    it "should capitalize the first word of multi-word stores" do
      store = Store.create({:name => "portland running company"})
      expect(store.name).to eq "Portland Running Company"
    end
  end

  describe "validation" do
    it "should fail to save if no name is provided" do
      store = Store.new({:name => ""})
      expect(store.save).to eq false
      expect(Store.all).to eq []
    end
  end
end
