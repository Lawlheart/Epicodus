require('rspec')
require('tamagotchi')

describe('Tamagotchi') do
  describe("#initialize") do
    it('sets the name and life levels of a new Tamagotchi') do
      my_pet = Tamagotchi.new("burnie")
      expect(my_pet.name).to eq("burnie")
      expect(my_pet.food_level).to eq(10)
      expect(my_pet.sleep_level).to eq(10)
      expect(my_pet.activity_level).to eq(10)
    end
  end

  describe("#time_passes") do
    it("decreases the amount of food the Tamagotchi has left by 1") do
      my_pet = Tamagotchi.new("Burnie")
      my_pet.time_passes(1)
      expect(my_pet.food_level).to(eq(9))
    end
    it("decreases the amount of sleep the Tamagotchi has left by 1") do
      my_pet = Tamagotchi.new("Burnie")
      my_pet.time_passes(1)
      expect(my_pet.sleep_level).to(eq(9))
    end
    it("decreases the amount of activity the Tamagotchi has left by 1") do
      my_pet = Tamagotchi.new("Burnie")
      my_pet.time_passes(1)
      expect(my_pet.activity_level).to(eq(9))
    end
  end

  describe("#is_alive?") do
    it('is alive if the food level is above 0') do
      my_pet = Tamagotchi.new("Burnie")
      expect(my_pet.is_alive?).to eq(true)
    end

    it('is dead if the food level is 0') do
      my_pet = Tamagotchi.new("Burnie")
      my_pet.time_passes(10)
      expect(my_pet.is_alive?).to(eq(false))
    end
  end

  describe("#feed") do
    it("increases the amount of food back to 10") do
      my_pet = Tamagotchi.new("Burnie")
      my_pet.feed()
      expect(my_pet.food_level).to(eq(10))
    end
  end
  
  describe("#play") do
    it("increases the amount of activity back to 10") do
      my_pet = Tamagotchi.new("Burnie")
      my_pet.play()
      expect(my_pet.activity_level).to(eq(10))
    end
  end
end
