from_file, to_file = ARGV; package = open(from_file).read
open(to_file, 'w').write(package);open(from_file).close;open(to_file).close
#
# puts "Copying from #{from_file} to #{to_file}"
#
# # We could do these two on one line, how?
# in_file = open(from_file)
# indata = in_file.read
#
# puts "The input file is #{indata.length} bytes long"
#
# puts "Does the output file exist? #{File.exist?(to_file)}"
# puts "Read, hit RETURN to continue, CTRL-C to abort."
# $stdin.gets
#
# out_file = open(to_file, 'w')
# out_file.write(indata)
#
# puts "Alright, all done."
#
# out_file.close
# in_file.close
