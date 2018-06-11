# this makes a variable, which in binary, means "2".
types_of_people = 10
# "There are 2 types of people"
x = 'There are #{types_of_people} types of people.'
# Base 2 number system
binary = 'binary'
# Another variable made to show the flexibility of #{} in strings
do_not = "don't"
# The punchline, only giving 2 answers, with a play on decimal vs binary notation
y = 'Those who know #{binary} and those who #{do_not}.'

# These two lines place the two strings together with #{} usage.
puts x
puts y

# Again, showing the flexibility of variable usage inside of #{}, this time
# putting the variable which contains #{}, in another string, in another #{}
puts "I said: #{x}."
puts "I also said: '#{y}'"

# An excellent boolean punchline variable
hilarious = false
# A string with another #{}, injecting a boolean value in a string.
joke_evaluation = "Isn't that joke so funny? #{hilarious}"
# prints the final punchline
puts joke_evaluation

# Two more string variables
w = "This is the left side of ..."
e = "a stright with a right side."
# Here we see that two strings can be added into a singular string
# This way it continues on the same line, instead of starting a linebreak.
puts w + e
