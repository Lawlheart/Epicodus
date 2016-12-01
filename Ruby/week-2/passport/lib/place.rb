class Place
  @@places_visited = []
  define_method(:initialize) do |location|
    @location = location
  end

  define_method(:location) do
    @location
  end
  define_singleton_method(:view_passport) do
    @@places_visited
  end
  define_method(:stamp_passport) do
    @@places_visited.push(self)
  end
  define_singleton_method(:get_new_passport) do
    @@places_visited = []
  end
end
