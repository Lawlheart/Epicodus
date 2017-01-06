require('spec_helper')

describe "RESTFUL routes for Stores and Brands", {:type => :feature} do
  describe "GET stores" do
    it "shows a list of all of the stores" do
      store = Store.create({:name => "portland running company"})
      visit "/"
      expect(page).to have_content "Portland Running Company"
    end
  end

  describe "GET one store" do
    it "shows the store info with the matching id" do
      store = Store.create({:name => "portland running company"})
      visit "/stores/#{store.id}"
      expect(page).to have_content "Portland Running Company"
    end
    it "allows user to add new brands to the store" do
      store = Store.create({:name => "portland running company"})
      visit "/stores/#{store.id}"
      fill_in('new-brand-name', :with => "Nike")
      click_button('Create Brand')
      expect(page).to have_content "Nike"
    end
  end

  describe "POST store" do
    it "allows the user to create new stores" do
      visit '/'
      fill_in('new-store-name', :with => 'Macys')
      click_button('Create Store')
      expect(page).to have_content "Macys"

    end
    it 'if the store exists, it will not make a duplicate' do
      Store.create({:name => "Macys"})
      visit '/stores'
      fill_in('new-store-name', :with => "Macys")
      click_button('Create Store')
      expect(page).to have_content('Macys', :count => 1)
    end
  end

  describe "DELETE store" do
    it 'allows users to delete stores on the list page' do
      store = Store.create({:name => "portland running company"})
      visit "/"
      find("#store-delete-#{store.id}").click
      expect(page).to have_content "Stores"
      expect(page).not_to have_content "Portland Running Company"
    end
    it 'allows user to delete store on the individual store page' do
      store = Store.create({:name => "portland running company"})
      visit "/stores/#{store.id}"
      find("#store-delete-#{store.id}").click
      expect(page).to have_content "Stores"
      expect(page).not_to have_content "Portland Running Company"
    end
  end

  describe "PATCH store" do
    it 'allows user to update store name' do
      store = Store.create({:name => "portland running company"})
      visit "/stores/#{store.id}"
      fill_in('update-store-name', :with => "Macys")
      click_button('Update Store')
      expect(page).to have_content "Macys"
    end
  end

  describe "GET brands" do
    it 'allows user to see a list of brands' do
      Brand.create({:name => "Nike"})
      visit '/brands'
      expect(page).to have_content "Nike"
    end
    it 'shows all stores that have carry that brand' do
      brand = Brand.create({:name => "Nike"})
      store = Store.create({:name => "portland running company"})
      store.brands.push(brand)
      visit '/brands'
      expect(page).to have_content "Portland Running Company"
    end
  end

  describe "GET one brand" do
    it 'allows user to see a list of stores associated with that brand' do
      brand = Brand.create({:name => "Nike"})
      store = Store.create({:name => "portland running company"})
      store.brands.push(brand)
      visit "/brands/#{brand.id}"
      expect(page).to have_content "Portland Running Company"
    end
    it 'allows the user to add a new store for that brand' do
      brand = Brand.create({:name => "Nike"})
      visit "/brands/#{brand.id}"
      fill_in('new-store-name', :with => "Portland Running Company")
      click_button("Create Store")
      expect(page).to have_content "Portland Running Company"
    end
  end

  describe "POST brands" do
    it 'allows user to add new brands' do
      visit '/brands'
      fill_in('new-brand-name', :with => "Nike")
      click_button('Create Brand')
      expect(page).to have_content('Nike')
    end
    it 'if the brand exists, it will not make a duplicate' do
      Brand.create({:name => "Nike"})
      visit '/brands'
      fill_in('new-brand-name', :with => "Nike")
      click_button('Create Brand')
      expect(page).to have_content('Nike', :count => 1)
    end
    it 'adds the same item to multiple stores correctly' do
      store1 = Store.create({:name => "portland running company"})
      store2 = Store.create({:name => "Macys"})
      brand = Brand.create({:name => "Nike"})
      store1.brands.push(brand)
      visit "/stores/#{store2.id}"
      fill_in('new-brand-name', :with => "Nike")
      click_button('Create Brand')
      expect(page).to have_content('Nike', :count => 1)
      expect(store1.brands.first).to eq store2.brands.first
    end
  end

  describe "UPDATE brands" do
    it 'allows user to update brands' do
      brand = Brand.create({:name => "Fikey"})
      visit "/brands/#{brand.id}"
      fill_in('update-brand-name', :with => "Nike")
      click_button("Update Brand")
      expect(page).to have_content "Nike"
    end
  end

  describe "DELETE brands" do
    it 'allows user to delete brands' do
      brand = Brand.create({:name => "Nike"})
      visit '/brands'
      find("#brand-delete-#{brand.id}").click
      expect(page).to have_content "Brands"
      expect(page).not_to have_content "Nike"
    end
  end
end
