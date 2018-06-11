first = ARGV

print "Tell me something else > "
balls = $stdin.gets.chomp
print "Hrmm, I want to know more > "
nuts = $stdin.gets.chomp
print "Well then, at least one more as well > "
fourth = $stdin.gets.chomp

puts "\tYour first argument was #{first}"
puts "\t\"#{balls}\" was the second flag listed."
puts "\tWell then, I guess #{nuts} was there as well."
puts "\tThe last flag of course was #{fourth}"
