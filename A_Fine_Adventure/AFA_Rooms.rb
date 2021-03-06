

module Options
    val_choice = ("1" || "2" || "3" || "north" || "south" || "east" || "west")
end
class Engine

  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('finished')

    while current_scene != last_scene
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    # be sure to print out the last scene
    current_scene.enter()
  end
end
class Map
  attr_accessor :options, :description

  include Options
  @@room = {
    'start' => Start.new(),
    'forest0' => Forest0.new(),
    'forest1' => Forest1.new(),
  }

  def initialize(start_scene)
    @start_scene = start_scene
  end

  def next_scene(scene_name)
    val = @@room[scene_name]
    return val
  end

  def opening_scene()
    return next_scene(@start_scene)
  end
end


class Start < Map
  def enter
    @description= """
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
    self.description
    @options = "\nWhat would you like to do?

        1. Go to sleep
        2. Listen
        3. Stand up"
    print "> "
    choice = $stdin.gets.chomp.downcase
      if choice == "1" || choice.include?("sleep")
        puts "\nJesus christ. Are you a narcoleptic?"
        puts "\nPress enter to waste your life"
        gets.chomp
        return 'start'
      elsif choice == "2" || choice.include?("listen")
        puts "\nYou hear small birds chirping and fluttering around. You think, '..A Belted Kingfisher, perhaps?' because you're a silly nerd"
      elsif choice == "3" || choice.include?("stand")
        puts "\nYou rub the sleep from your eyes, and manage to heave your dumb forest sleeping ass onto your stumpy feet like the beautiful bastard that you are."
        puts "\n\nPress enter to be productive."
        gets.chomp
        return 'forest0'
      elsif choice.include?("help" || "look")
        puts @options
      elsif choice.include?("fap")
        puts "\nfinlevLewd"
      else choice != val_choice || val_direction
        puts "\n\"#{choice}\"? Sorry, this response doesn't make sense for the situation at hand, just like it doesn't make sense that you're capable of literacy"
        return 'start'
      end
  end
end

class Forest0 < Map
  def enter

     @description =  """
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
     # Have a repeatable input to stay in a room until keywords are fufilled
   self.description
      print "> "
    choice = $stdin.gets.chomp.downcase
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
        return 'forest1'
      elsif choice.include?("west" || "south" | "north")
        puts "\nThe foliage is far too thick, you can't go this way."
      elsif choice.include?("help" || "look")
        puts options
      else choice != val_choice
        puts "\"#{choice}\"? Again with your inaptitude to literally pick between 3 options."
    end
  end
end

class Forest1 < Map
  def enter
    @description = """
    ---------

  After surviving your harrowing journey of two inches (finlevLewd) you find yourself in the middle of the forest path. It feels like mid-morning with the air warming gradually.

  Looking around, other than the paths the trees continue on for as far as you can see.

  The large rock is just south of where you stand, wedged firmly between two heavy Redwood trunks.
  To the west is your personal hobo camp, but what catches your eye immediately is a giant mechanical door that you see stapled onto the large bolder.

    ---------

    \nWhat would you like to do?

      1. Step closer to the bolder.
      2. Look at the source of the whistling
      3. Set self on fire
    """
    self.description
  end
end

    options = "\nWhat would you like to do?
    1. Step closer to the bolder.
    2. Look at the source of the whistling
    3. Set self on fire"
    print "> "
    choice = $stdin.gets.chomp.downcase
      if choice == "1" || choice.include?("step")
        puts "You are an inquisitive one aren't you?"
        puts "Press Enter to continue"
        gets.chomp
      elsif choice == "2" || choice.include?("investigate")
        puts "\nYou take a closer look at the sound of the birds, and notice that is in fact not a Belted Kingfisher, but instead a South Dakotan man whistling at a blackjack table while setting a pile of money on fire. \n\n Neat!"
      elsif choice == "3" || choice.include?("path" || "east" || "step")
        puts "\nYou step onto the path and are immediately surprised by the sensation of missing a step on stairs. You're fine, but you were really freaked out for a second and you hear laughter directed at you."
        puts "Press enter to feel shamed"
        gets.chomp
        'forest1'
      elsif choice.include?("west" || "south" | "north")
        puts "\nThe foliage is far too thick, you can't go this way."
      elsif choice.include?("help" || "look")
        puts options
      # else choice != val_choice
      #   puts "\"#{choice}\"? Again with your inaptitude to literally pick between 3 options."
end
