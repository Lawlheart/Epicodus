class Fixnum
  define_method(:ping_pong) do
    output = []
    for n in 1..self do
      if n % 15 == 0
        output.push("pingpong")
      elsif n % 3 == 0
        output.push("ping")
      elsif n % 5 == 0
        output.push("pong")
      else
        output.push(n)
      end
    end
    output
  end
end
