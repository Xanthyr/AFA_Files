# Creates a string, about Mary and a lamb
puts "Mary had a little lamb."
# Made another string, and this time the #{} operator had a ''-string inside
# without a variable to pass information to it.
puts "Its fleece was white as #{'snow'}."
# Another string.
puts "And everywhere that Mary went."
# Creates string, then repeats the string 10 times, creating a line of dots.
puts "." * 10 # what'd that do?

# A buncha variables as single character strings
end1 = "C"
end2 = "h"
end3 = "e"
end4 = "e"
end5 = "s"
end6 = "e"
end7 = "B"
end8 = "u"
end9 = "r"
end10 = "g"
end11 = "e"
end12 = "r"

  # watch that print vs. puts on this line what's it do?
  # If you replace the print command with the puts that we have been using
  # It will create a linebreak. However, it seems that print will go onto
  # whatever output is next in line.
  print end1 + end2 + end3 + end4 + end5 + end6
  puts end7 + end8 + end9 + end10 + end11 + end12
