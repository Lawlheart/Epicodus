class Fixnum
  define_method(:change) do
    num = self

    values = {
      :Quarters => 25,
      :Dimes => 10,
      :Nickels => 5,
      :Pennies => 1
    }
    result = {
      :Quarters => 0,
      :Dimes => 0,
      :Nickels => 0,
      :Pennies => 0
    }

    values.each() do |coin, value|
      if num >= value
        result.store(coin, num/value)
        num %= value
      end
    end
    result
  end
end
