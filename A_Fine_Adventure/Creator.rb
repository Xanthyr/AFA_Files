
module Creator
  include Rng
  include Combat

  def start_sim
    puts "*" * 80
    puts "Welcome to DnD Fight Club. Make a dude to fight with. Press Enter to begin."
    $stdin.gets.chomp
    creator
  end

  puts "*" * 80
  puts "Okay, first, what will this fighter's name be?\n"
  name = $stdin.gets.chomp
  dude1 = Dude.new(name)
  puts "Alrighty then, welcome to the club #{dude1.name}.\n"
  puts "Now we have #{dude1.name}, let's describe how they fight. \n\nWhat is the preferred method of attack?\n"
  dude1.set_weapon($stdin.gets.chomp)
  puts "And how many dice does this attack require?\n"
  dude1.set_dice_num($stdin.gets.chomp.to_i)
  puts "What type of dice does the attack use?\n"
  dude1.set_dice_type($stdin.gets.chomp.to_i)
  puts "Excellent, so they fight with their #{dude1.weapon}, and it does #{dude1.dice_num}d#{dude1.dice_type} damage.\n"
  puts "What about their armor? How much armor class do they have?\n"
  dude1.set_armor($stdin.gets.chomp.to_i)
  puts "And finally, how many health points do they have?\n"
  dude1.set_hp($stdin.gets.chomp.to_i)
  puts "Wonderful, Phase 1 has been completed.\n"

  puts "*" * 80
  puts "Now, we have to make an opponent for your guy to fight. What is their name?\n"
  name = $stdin.gets.chomp
  dude2 = Dude.new(name)
  puts "Alrighty then, welcome to the club #{dude2.name}."
  puts "Now we have #{dude2.name}, let's describe how they fights What is the preferred method of attack?\n"
  dude2.set_weapon($stdin.gets.chomp)
  puts "And how many dice does this attack require?\n"
  dude2.set_dice_num($stdin.gets.chomp.to_i)
  puts "What type of dice does the attack use?\n"
  dude2.set_dice_type($stdin.gets.chomp.to_i)
  puts "Excellent, so they fight with their #{dude2.weapon}, and it does #{dude2.dice_num}d#{dude2.dice_type} damage.\n"
  puts "What about their armor? How much armor class do they have?\n"
  dude2.set_armor($stdin.gets.chomp.to_i)
  puts "And finally, how many health points do they have?\n"
  dude2.set_hp($stdin.gets.chomp.to_i)
  puts "Fantastic, that wraps it all up. Let's head to the brawl.\n"
  puts "*" * 80
  puts "And now all your hard work has come to fruition! A battle to the death between your two fighters, #{dude1.name} and #{dude2.name}"
  puts "Prepare your butts, because they are about to get their brawl on!"
  puts "Press enter to watch the carnage."
  $stdin.gets.chomp
  dude1.throwdown(dude2)
  dude1.status
  dude2.status
  puts "Thank you for playing!\n"
  puts "Would you like to start over? [y/n]"
  answer = $stdin.gets.chomp.downcase
  if answer == "y"
    start
  else
    exit
  end
end
# start