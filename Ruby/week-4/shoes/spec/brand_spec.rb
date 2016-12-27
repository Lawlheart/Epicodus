require('spec_helper')

describe Brand do
  describe "the many to many relationship" do
    it "should wire it up properly" do
      should have_and_belong_to_many(:stores)
    end
  end
  describe "callbacks" do
    it "should capitalize brand names" do
      brand = Brand.create({:name => "nike"})
      expect(brand.name).to eq "Nike"
    end
    it "should capitalize the first word of multi-word brands" do
      brand = Brand.create({:name => "new balance"})
      expect(brand.name).to eq "New Balance"
    end
  end
  describe "validation" do
    it "should fail to save if no name is provided" do
      brand = Brand.new({:name => ""})
      expect(brand.save).to eq false
      expect(Brand.all).to eq []
    end
  end

  describe "find_or_create_by" do
    it "should make a new instance of the class if one of the same name doesn't exist" do
      brand = Brand.find_or_create_by({:name => "Nike"})
      expect(brand.name).to eq("Nike")
      expect(Brand.all).to eq [brand]
    end
    it "should return an existing instance of the class if one exists with the same name" do
      Brand.create({:name => "nike"})
      brand = Brand.find_or_create_by({:name => "Nike"})
      expect(brand.name).to eq("Nike")
      expect(Brand.all).to eq [brand]
    end
  end
end
