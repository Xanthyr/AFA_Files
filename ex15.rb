# ARGV grabs input from user for the filename variable.
puts "Type in a text file name."
filename = ARGV.first

# Assigns the name text to the open function
txt = open(filename)
# puts the name of the filename
puts "Here's your file #{filename}:"
# calls read method on the txt object
print txt.read
txt.close()
# requests you type the filename again
print "Type the filename again: "
# Asks for input, and assigns it to the file_again variable.
file_again = $stdin.gets.chomp
# Reassigns the open function on the file_again object to a new object name
txt_again = open(file_again)

print txt_again.read
txt_again.close()
