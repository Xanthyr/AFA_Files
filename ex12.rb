# print "Give me a number: "
# number = gets.chomp.to_f
#
# bigger = number * 100
# puts "A bigger number is #{bigger}."
#
# print "Give me another number: "
# another = gets.chomp
# number = another.to_f
#
# smaller = number / 100
# puts "A smaller number is #{smaller}."


print "Hey man, you want in? Gimme a dollar amount deposit."
cash = gets.chomp.to_f
kickback = cash.to_f * 0.1
puts "Thank you for your patronage. In fact, here have #{kickback} back, for pocket change."
