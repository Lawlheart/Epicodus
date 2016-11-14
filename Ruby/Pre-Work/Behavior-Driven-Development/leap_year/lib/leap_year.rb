class Fixnum
  define_method(:leap_year?) do
    self % 4 == 0 && (self % 100 != 0 || self % 400 == 0)
  end
end