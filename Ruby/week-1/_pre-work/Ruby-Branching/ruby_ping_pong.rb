class Fixnum
  define_method(:ping_pong) do
    pingpong = []
    (self + 1).times do |i|
      if i % 5 == 0 && i % 3 == 0 && i > 0
        pingpong.push('pingpong')
      elsif i % 5 == 0 && i > 0
        pingpong.push('pong')
      elsif i % 3 == 0 && i > 0
        pingpong.push('ping')
      else
        pingpong.push(i)
      end
    end
    pingpong
  end
end

puts 30.ping_pong.inspect