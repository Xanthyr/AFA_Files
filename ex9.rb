# Here's some new strange stuff, remember to type it exactly.

# Created a variable defined as a string with 7 entries, only separated by
# spaces, no other characters.
days = "Mon Tue Wed Thu Fri Sat Sun"
# A string variable with newline-break characters, \n, this will puts
# the following piece of the string on a new line.
months = "Jan\nFeb\nMar\nApr\nMay\nJun\nJul\nAug"
# Here, the puts iterates through the entire string, listing every substring
puts "Here are the days: #{days}"
# Same interaction as the days, but while it is iterating, it sees the
# Newline breaks, and places them on new lines.
puts "Here are the months: #{months}"
# A really cool thing! It appears to be a quote block. In terminal it
# Is indented on top and bottom, emphasizing itself.
puts %q{
  There's something going on here.
  With this weird quote
  We'll be able to type as much as we like.
  Even 4 lines if we want, or 5, or 6.
 }
