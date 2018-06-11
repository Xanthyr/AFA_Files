puts "I will now count my chickens:"

# 30 divided by 6 = 5, then add 25; resulting as 30.
puts "Hens #{25.0 + 30.0 / 6.0}"
# 25 times 3 = 75, then modulous 75 by 4. 4*18=72, 75-72= 3, then 100 - 3 = 97.
puts "Roosters #{100.0 - 25.0 * 3.0 % 4.0}"
puts "Now I will count the eggs:"

# 4 modulous by 2 = 0, 1 divided by 4 = 0(non-float), then 6-5=1, 1 + 6 = 7.
puts 3.0 + 2.0 + 1.0 - 5.0 + 4.0 % 2.0 - 1.0 / 4.0 + 6.0

puts "Is it true that 3 + 2 < 5 - 7?"
# 5 - 7 = -2, 3 + 2 = 5. 5 !< -2; false
puts 3.0 + 2.0 < 5.0 - 7.0
# 3 + 2 = 5
puts "What is 3 + 2? #{3.0 + 2.0}"
# 5 - 7 = -2
puts "What is 5-7 #{5.0 - 7.0}"

puts "Oh, that's why it's false."

puts "How about some more."
# 5 is greater than -2; true
puts "Is it greater? #{5.0 > -2.0}"
# 5 is greater than equal to -2; true
puts "Is it greater or equal? #{5.0 >= -2.0}"
# 5 is less than equal to -2; false
puts "Is it less or equal? #{5.0 <= -2.0}"
