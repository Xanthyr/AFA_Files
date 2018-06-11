
def hex_gear(teeth)
    if teeth > 6
      puts "Oh wow, #{teeth} teeth is actually too many, this gear won't fit."
      return teeth
    elsif teeth < 6
      puts "Oh wow, #{teeth} is actually too few, this gear won't fit."
      return teeth
    elsif teeth == 6
        puts " Oh wow! This gear fits like a glove. Good job! You hear a mechanical whirring from behind the wall you're facing, and a door reveals the dungeon further"
      return teeth
    else teeth.include?(string.class)
      puts "Use the god damn number keys, jesus."
    end
  end

  intro = """
  \rIn front of you is a gray metal panel with the cover removed, revealing a conspicuous gear shaped hole
  \nYou have a range of gears that might fit. Pick from gears 1 through 10

  """


  puts "\n\n\nYou're left with a large stack of similar looking mechanical parts"
  puts intro
  print prompt

choice = $stdin.gets.chomp.to_i


while hex_gear(choice) != 6
  puts "\nYou have a range of gears that might fit. Pick from gears 1 through 10"
  print prompt
  choice = $stdin.gets.chomp.to_i
end
