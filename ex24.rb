puts "Let's practice everything."
# messing around with escape characters to allow abbreviation of 'about' to "'bout"
# to prevent single quote string in the middle between you'd and 'bout.
puts 'You\'d need to know \'bout escapes with \\ that do \n newlines and \t tabs.'

# the <<END is a "heredoc". See the Student Questions.
# Defines a variable as a heredoc, continues as a multiline string until <<TRIGGER
# has been input
poem = <<BUTTSW
\tThe lovely world
with logic so firmly planted
cannot discern \n the needs of love
nor comprehend passion from intuition
and requires an explanation
\n\twhere there is none.
BUTTSW

# simple frame
puts "--------------"
# puts value for heredoc variable.
puts poem
# simple frame
puts "--------------"

# Originally assumed this would evaluate to 2 + 3, 10 - 5, 5 - 6, but it didn't.
# It appears that possibly addition and subtraction are seen as equal priority
# and evaluate directly from left to right.
# 10 - 2 = 8 + 3 = 11 - 6 = 5
five = 10 - 2 + 3 - 6
puts "This should be five: #{five}"

# Scales numbers based off of argument passed through secret_formula function
def secret_formula(started)
  # First referenced value
  jelly_beans = started * 500.0
  # Second referenced value
  jars = jelly_beans / 1000.0
  # Third referenced value
  crates = jars / 100.0
  # returns/saves value to temporary variables in sequential order to be called on
  return jelly_beans, jars, crates
end

# defines start_point as int value 10,000,setting scale for rest of numbers.
start_point = 10000
# defines three variables as equal to arguments of secret_formula function
# pulls value from first mentioned variable to last, mixing output format order possible
beans, jars, crates = secret_formula(start_point)

puts "With a starting point of: #{start_point}"
# Notice that the function variable definition is called here in the #{} format
# However, it doesn't match literally to the original name. According to lesson,
# variables inside of a function are temporary, and can be referred to it later
# in a different name.
puts "We'd have #{beans} beans, #{jars} jars, and #{crates} crates"

# redefining value against itself later on in the code before next function call
start_point= start_point / 10
puts "We can also do that this way:"
# puts we have %s and %d variables with the % <function(args)> at the end. I believe
# that % converts to various data types pending flag. %d(digit?), %s(string?)%x(hex?)
puts "We'd have %s beans, %d jars, and %d crates." % secret_formula(start_point)
