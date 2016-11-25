class Vehicle
  define_method(:initialize) do |make, model, year|
    @make = make
    @year = year
  end
  define_method(:age) do
    current_year = Time.new.year
    current_year - @year
  end
  define_method(:worth_buying?) do
    american_made = ["Chrysler", "Ford", "GM"].include?(@make)
    american_made and age <= 15
  end
end