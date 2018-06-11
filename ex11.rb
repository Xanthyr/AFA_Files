# print "How old are you? "
# age = gets.chomp
# print "How tall are you? "
# height = gets.chomp
# print "How much do you weight? "
# weight = gets.chomp
#
# puts "So, you're #{age} old, #{height} tall and #{weight} heavy."




puts "Hello, I am the Guy!"
puts "How many hours do you sleep?"
hours = gets.chomp
hours

puts "#{hours}? Oh my, that won't do at all.. I suggest you change."

  if hours.to_i < 8
    puts "You should sleep at least 8 hours, man!"
  elsif hours.to_i > 8
    puts "You really shouldn't sleep all day!"
  else
    hours.to_i == 8
    puts "Actually, your sleep schedule is proper. Good job!"
  end
