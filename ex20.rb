# creates variable, command line argument for source file.
input_file = ARGV.first

# f is a variable defined as a file. Defined function print_all
# using the file as the argument. f calls the read method and puts.
def print_all(f)
  puts f.read
end

# seek(0) method brings ruby to the top of the file, byte 0
def rewind(f)
  f.seek(0)
end
# line_count argument created, with file argument
def print_a_line(line_count, f)
  # puts line format, comma, file gets.chomp to pull a line without linebreak
  puts "#{line_count}, #{f.gets.chomp}"
end

# Redefining the ARGV file as a new variable
current_file = open(input_file)

puts "First let's print the whole file:\n"

# calls the print_all function on current_file. translates to:
# puts open(inputfile).read to dump entire text contents.
print_all(current_file)

puts "Now let's rewind, kind of like a tape."

# calls rewind on current_file, open(input_file).seek(0)
rewind(current_file)

puts "Let's print three lines:"

# sets a variable to 1, then calls a function to pull this variable as an
# argument. print_a_line(current_line, file)
# puts the result
current_line = 1

# Now current line is redefining itself, by incrementing itself further
# However this execution is sloppy.
3.times do
 print_a_line(current_line, current_file)
 current_line += 1
end
  # current_line = current_line + 1
  # print_a_line(current_line, current_file)
  #
  # current_line = current_line + 1
  # print_a_line(current_line, current_file)
