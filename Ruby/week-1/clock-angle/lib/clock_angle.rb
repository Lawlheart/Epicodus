class String
  define_method(:clock_angle) do
    a = split(":")
    minutes_angle = a[1].to_f() * 6
    hours_angle = a[0].to_f() * 30 + a[1].to_f()/2
    angle = (hours_angle - minutes_angle).abs
    if angle > 180
      360 - angle
    else
      angle
    end
  end
end

# 30 minutes is 180 for minutes hand, 1/24 arc = 360/24 = 15 degrees
# Therefore: Every minute makes the hour hand move by half a degree
