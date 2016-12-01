class Tamagotchi
  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
  end

  define_method(:name)           { @name }
  define_method(:food_level)     { @food_level }
  define_method(:sleep_level)    { @sleep_level }
  define_method(:activity_level) { @activity_level }

  define_method(:is_alive?) do
    @food_level > 0
  end

  define_method(:feed) do 
    @food_level = 10
  end

  define_method(:time_passes) do |time_passed|
    @food_level -= time_passed
    @sleep_level -= time_passed
    @activity_level -= time_passed
  end

  define_method(:play) do
    @activity_level = 10
  end

end
