class Array
  define_method(:queen_attack?) do | target |
    self[0] == target[0] or self[1] == target[1] or (self[0]-target[0] == self[1] - target[1])
  end
end
