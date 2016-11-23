class MyTime
  define_method(:initialize) do |year, month, day|
    @year = year
    @month = month
    @day = day
  end

  define_method(:months_to_december) do
    12 - @month
  end
end

birthday = MyTime.new(1988, 6, 29)
p birthday.months_to_december
