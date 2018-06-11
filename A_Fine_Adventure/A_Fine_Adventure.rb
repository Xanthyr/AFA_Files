def prompt
  print "> "
end
val_choice = ("1" || "2" || "3")

def start


  puts """
  ---------

You wake up slowly, soft damp earth underneath your nerdy frame.
  The air is crisp, and slightly cold. The trees are incredibly tall, with dull red bark, almost the color of clay.
Directly next to where you were sleeping there is a path that leads north and south.

  ---------
  \nWhat would you like to do?

      1. Go to sleep
      2. Listen
      3. Stand up
  """


  loop do
    options = "\nWhat would you like to do?

        1. Go to sleep
        2. Listen
        3. Stand up"
    print "> "
    choice = $stdin.gets.chomp.downcase
    val_choice = ("1" || "2" || "3")
    val_direction = ("north" || "south" || "east" || "west")
      if choice == "1" || choice.include?("sleep")
        puts "\nJesus christ. Are you a narcoleptic?"
        puts "\nPress enter to waste your life"
        gets.chomp
        start
      elsif choice == "2" || choice.include?("listen")
        puts "\nYou hear small birds chirping and fluttering around. You think, '..A Belted Kingfisher, perhaps?' because you're a silly nerd"
      elsif choice == "3" || choice.include?("stand")
        puts "\nYou rub the sleep from your eyes, and manage to heave your dumb forest sleeping ass onto your stumpy feet like the beautiful bastard that you are."
        puts "\n\nPress enter to be productive."
        gets.chomp
        forest0
      elsif choice.include?("help" || "look")
        puts options
      elsif choice.include?("fap")
        puts "\nfinlevLewd"
      else choice != val_choice || val_direction
        puts "\n\"#{choice}\"? Sorry, this response doesn't make sense for the situation at hand, just like it doesn't make sense that you're capable of literacy"
      end
  end
end

def forest0

   puts  """
   ---------

Now that you've managed to make a decision to do something other than rot away on the forest floor, you realize that you're actually covered with leaves and have a bunch of gross twigs and stuff in your hair.

With your new vantage point, you notice that the path to the south is actually blocked by a very large stone with small script etched into the side.

The sounds of the birds chirping shift into a more human sound, and is far closer than you previously realized.


   ---------
   \nWhat would you like to do?

   1. Lie down again
   2. Investigate the source of the whistling
   3. Step into forest path
   """
  loop do
      options = "\nWhat would you like to do?

      1. Lie down again
      2. Look at the source of the whistling
      3. Step into forest path"

      print "> "
      choice = $stdin.gets.chomp.downcase

      val_choice = ("1" || "2" || "3")
        if choice == "1" || choice.include?("lie")
          puts "\nYou slothenly turn back to bed."
          puts "And like a dumb milennial, you're killing this game"
          sleep (2)
          start
        elsif choice == "2" || choice.include?("investigate")
          puts "\nYou take a closer look at the sound of the birds, and notice that is in fact not a Belted Kingfisher, but instead a South Dakotan man whistling at a blackjack table while setting a pile of money on fire. \n\n Neat!"
        elsif choice == "3" || choice.include?("path" || "east" || "step")
          puts "\nYou step onto the path and are immediately surprised by the sensation of missing a step on stairs. You're fine, but you were really freaked out for a second and you hear laughter directed at you."
          puts "Press enter to feel shamed"
          gets.chomp
          forest1
        elsif choice.include?("west" || "south" | "north")
          puts "\nThe foliage is far too thick, you can't go this way."
        elsif choice.include?("help" || "look")
          puts options
        else choice != val_choice
          puts "\"#{choice}\"? Again with your inaptitude to literally pick between 3 options."
      end
  end
end

def forest1
  puts """
  ---------

After surviving your harrowing journey of two inches (finlevLewd) you find yourself in the middle of the forest path. It feels like mid-morning with the air warming gradually.

Looking around, other than the paths the trees continue on for as far as you can see.

The large rock is just south of where you stand, wedged firmly between two heavy Redwood trunks.
  To the west is your personal hobo camp.

  ---------
  """
end
  puts """
  *******************************'A Fine Adventure'*******************************

                                Hello and Welcome!

                            My fair nerds and nerdesses

                    This is a simple choose your own adventure game
                    It is nothing fancy, but it is ours to share

                I do hope that you enjoy your time, and thank you for playing.
  ********************************************************************************
  """



puts "\n\n\nWell, first and foremost, what is your name?"
prompt
user_name = $stdin.gets.chomp

puts "\n\n#{user_name}?!

Welcome, welcome! I just have a one more question for you:"

puts "\n\nWhere are you from?"

sleep(1)

puts "\nPlease use the options provided

1. North America
2. EU/UK
3. South America
"
print prompt

user_country = $stdin.gets.chomp
if user_country == "1"
  user_country = "North America"
  puts "Enjoy your stay!
  In order to make this experience as authentic as possible
  automatic rifles are now a one time $800 purchase
  and medical insurance has been increased to $4000 per month"
elsif user_country == "2"
  user_country = "EU/UK"
  puts "Enjoy your stay!
  In order to make this experience as authenic as possible
  we have provided you with a cup of tea, a pint of beer.
  One to drink, and one to scoff at, at your leisure. Also we will now add
  a shitload of 'U's to wourds make you feeul at easeu"
elsif user_country == "3"
  user_country = "South America"
  puts "Aproveite sua estadia!
Traduzimos as palavras para o português
porque essa é a única língua falada na América do Sul.
  //
  Enjoy your stay!
We have translated the words to Portuguese
because that's the only language spoken in South America."
else user_country != val_choice
  puts "\"%s\", are you serious?" % user_country
  puts "I can already tell this is going to take a while."
end
sleep (1)

puts "\n\n\nWell then, #{user_name} from #{user_country} let's have ourselves an adventure."

puts "When you are ready, push enter"
$stdin.gets.chomp

# prompt
# choice = $stdin.gets.chomp
# while start != 3
#     puts "\nWhat would you like to do?"
#     puts "1. Go to sleep"
#     puts "2. Listen"
#     puts "3. Stand up"
#     prompt
#   if start == 3
#     forest0
#     choice = $stdin.gets.chomp
#   end
# end

start
