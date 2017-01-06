class Parcel
  define_method(:initialize) do |length, width, height, weight|
    @length = length
    @width = width
    @height = height
    @weight = weight
  end
  define_method(:volume) do
    @length * @width * @height
  end
  define_method(:cost_to_ship) do |speed, distance|
    # X Formula: volume < 30, fixed($5). After that, scaled
    # X make a hash for delivery methods with cost multipliers
    # X add $1 per pound
    # local (<200 km), regional, long distance, flat fee
    # local and standard have no additional fees
    # https://maps.googleapis.com/maps/api/distancematrix/json?origins=Portland+OR&destinations=Seattle+WA&units=imperial&key=GOOGLE_MAPS_API_KEY
    fees = {'standard' => 0, 'express' => 100}

    if volume < 30
      base_cost = 50 + @weight
    else
      base_cost = 50 + @weight + volume * 0.2
    end
    if distance < 200
      distance_fee = 0
    elsif distance < 500
      distance_fee = 100
    else
      distance_fee = 300
    end
    additional_fees = fees[speed] + distance_fee

    (base_cost + additional_fees)
  end
end
