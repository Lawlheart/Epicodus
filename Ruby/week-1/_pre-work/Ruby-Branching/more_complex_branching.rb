puts 'What is your grade? [A/B/C/D/F] '
grade = gets.chomp

if grade == 'A'
  puts 'A winner is you!'
elsif grade == 'B' || grade == 'C'
  puts 'Not too shabby!'
elsif grade == 'D' || grade == 'F'
  puts 'You lose! Good day, sir!'
end

puts 'What temperature is it outside? '
temperature = gets.chomp.to_i

if temperature >= 60 && temperature <= 80
  puts 'It\'s balmy outside! Whatever that means...'
elsif temperature > 80
  puts 'TOO HOT!'
elsif temperature < 60
  puts 'Eh, better cold than hot!'
end

puts 'WHAT ... is your name? '
name = gets.chomp

if ('a'..'m').include?(name.chars.first.downcase)
  puts 'Room 1 for you.'
else
  puts 'Looks like you get Room 2'
end