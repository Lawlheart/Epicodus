require('spec_helper')

describe Tag do
  describe '#recipes' do
    it 'will establish the many to many relationship' do
      steak_pie = Recipe.create({:name => "Steak Pie", :instruction => "Many"})
      test_tag = Tag.create({:name => "meat"})
      steak_pie.tags.push(test_tag)
      expect(test_tag.recipes).to eq [steak_pie]
    end
  end
  describe '.find_by_name' do
    it 'will find the tag by name' do
      test_tag = Tag.create({:name => "meaty"})
      expect(Tag.find_by_name("meaty")).to eq test_tag
    end
  end
  describe '.make_all' do
    it 'will make all of the tags in the comma separated string' do
      Tag.make_all('alpha, beta, gamma')
      expect(Tag.all).to eq [Tag.find_by_name('alpha'), Tag.find_by_name('beta'), Tag.find_by_name('gamma')]
    end
    it 'will make new tags if they don\'t exist and use existing tags if they exist' do
      alpha = Tag.create({:name => "alpha"})
      Tag.make_all('alpha, beta, gamma')
      expect(Tag.all).to eq [alpha, Tag.find_by_name('beta'), Tag.find_by_name('gamma')]
    end
  end
end
