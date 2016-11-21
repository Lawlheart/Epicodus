class Fixnum
  define_method(:allergens) do
      current = self
      matches = []
      key = {
        :cats         => 128,
        :pollen       => 64,
        :chocolate    => 32,
        :tomatoes     => 16,
        :strawberries => 8,
        :shellfish    => 4,
        :peanuts      => 2,
        :eggs         => 1,
      }
      key.each do |allergen, code|
        if current >= code
          current -= code
          matches.push(allergen.to_s)
        end
      end
      matches
  end
end

p 3.allergens
