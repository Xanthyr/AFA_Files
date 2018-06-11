puts "What's up brah, welcome to the Fairway to Seven"
puts "Want to learn an instrument? What do you want to play?"
prompt = ' >'
first_respose = gets.chomp
 puts prompt

def chords_known(number_of_strings, number_of_fingers, number_of_frets)
  puts "\nThere are #{number_of_strings} strings for this instrument"
  puts "Depending on how you hold the neck, you can use #{number_of_fingers} fingers here."
  puts "Work on your stretches, then you can reach #{number_of_frets} frets."
  puts "Then you'll be a rockstar in no time!\n\n\n"
end

first_respose

if first_respose == "guitar"
    puts guitar = chords_known(6, 9, 24)
 elsif first_respose == "bass"
   puts bass = chords_known(4, 9, 22)
 elsif first_respose == "mandolin"
   puts mandolin = chords_known("Eight", "Six", 14)
 else first_respose == "drums"
   puts drums = chords_known(0, 0, 0)
end






# # Creating a function, cheese_and_crackers, with two arguments
# # cheese_count, and boxes_of_crackers.
# # Then puts describes the format for the resolution of the two arguments.
# def cheese_and_crackers(cheese_count, boxes_of_crackers)
#   puts "You have #{cheese_count} cheeses!"
#   puts "You have #{boxes_of_crackers} boxes of crackers!"
#   puts "Man that's enough for a party!"
#   puts "Get a blanket.\n\n"
# end
#
# # Here, we refer to the function itself, cheese_and_crackers, with arguments
# # input as integers
# puts "We can just give the function numbers directly:"
# cheese_and_crackers(20, 30)
#
# # Now we create new variables, described as integers, 10 and 50.
# puts "OR, we can use variables from our script:"
# amount_of_cheese = 10
# amount_of_crackers = 50
#
# # Here we call the function again, and place the variables as the arguments.
# # the function grabs the variables and passes them through.
# cheese_and_crackers(amount_of_cheese, amount_of_crackers)
#
# # Function call again, this time with math placed inside the args.
# # The args are integers, so can be evaluated to singular numbers, 30 and 6
# puts "We can even do math inside too:"
# cheese_and_crackers(10 + 20, 5 + 6)
#
# # And here, we are combining integer variables with integer values.
# # The function will still run with strings in the previous iterations
# # However we are unable to combine to_s with to_i here.
# puts "And we can combine the two, variables and math:"
# cheese_and_crackers(amount_of_cheese + 100, amount_of_crackers + 1000)
