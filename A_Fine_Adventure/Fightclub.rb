module Rng
  def diceroll(rolls, dice)
  allRolls = []
 rolls.times do
   result = 1 + rand(dice)
   allRolls.push(result, @ability_mod)
   @damage = allRolls.sum
  end
  # puts "#{@name}, with a +#{@ability_mod} damage modifier, #{rolls} rolls of the d#{dice}, you have rolled #{allRolls.join(' + ')} with a total of #{@damage}"
  end
end

module Combat
  include Rng
  BASE_STATS = {
      max_hp: 10,
      ability_mod: 1
  }

  def Combat.included(mod)
    attr_accessor :hit_points, :ability_mod
  end

  def initialize_stats(stats)
    @stats = stats

    @hit_points = stats[:max_hp]
    @ability_mod = stats[:ability_mod]
  end

  def alive?
    @hit_points > 0
  end

  def set_armor(armor_class)
    @armor_class = armor_class
  end

  def armor_class
    @armor_class
  end


  def hurt(amount)
    @hit_points -= amount
    puts "#{@name} has #{@hit_points} health remaining!"
  end

  def heal(amount)
    @hit_points += amount
    @hit_points = [@hit_points, @char_max_hp].min
  end
  def basic_attack(target)
    puts "\n#{self.name} attacks #{target.name} with their #{@weapon}!\n"
    diceroll(1, 20)
    if @damage >= target.armor_class
      puts "\n#{self.name} needed to roll at least #{target.armor_class}, and they rolled a #{@damage}! The attack hits!\n"
      diceroll(@dice_num, @dice_type)
      puts "\n#{self.name} attacks #{target.name} with their #{@weapon} for #{@damage} points of damage!\n"
      target.hurt(@damage)
      puts "\n"
    else
      puts "\n\n#{self.name} needed to roll at least #{target.armor_class}, but they rolled a #{@damage}! The attack whiffs! finlevThump!\n"
    end
  end
  def throwdown(target)
    turns = 0
    puts "\nOh shit! #{self.name} and #{target.name} are throwing down hard!"
    while self.alive? && target.alive?
      self.basic_attack(target)
      if self.alive? == false && target.alive
        puts "Yo, #{self.name} just got dunked on super hard!\n\n"
      end
      if target.alive? == false
        puts "Yo, #{target.name} just got dunked on super hard! It took #{turns} turns!\n\n"
        puts self.status
        puts target.status
      end
      break unless self.alive? && target.alive?
      target.basic_attack(self)
      turns += 1
    end
  end
end

class Dude
  include Combat
  include Rng
  MAX_HP = 9999
  def initialize(name)
    @name = name
    initialize_stats(BASE_STATS.merge ({
        max_hp: MAX_HP
    }))
  end
  def equip(name, dice_num, dice_type)
    @weapon, @dice_num, @dice_type = name, dice_num, dice_type
  end

  def set_weapon(weapon)
    @weapon = weapon
  end

  def weapon
    @weapon
  end

  def dice?
    [@dice_num, @dice_type]
  end

  def dice_num
    @dice_num
  end

  def dice_type
    @dice_type
  end

  def set_dice_num(dice_num)
    @dice_num = dice_num
  end

  def set_dice_type(dice_type)
    @dice_type = dice_type
  end

  def ability_mod(modifier)
    @ability_mod = modifier
  end
  def set_hp(health)
    @hit_points = health
    @char_max_hp = health
  end
  def char_max_hp
    @char_max_hp
  end
  def name
    @name
  end
  def status
    puts "*" * 80
    puts self.name
    puts "Hitpoints: #{@hit_points}/#{self.char_max_hp}"
    puts "Ability Modifier: #{@ability_mod}"
    puts "#{@weapon} #{dice_num}d#{dice_type}"
    puts "*" * 80
  end
end

class Wizard < Dude
  def fireball
    puts "#{@name} is casting Fireball!"
    diceroll(3, 6)
  end
end

class Fighter < Dude
    def beyblade(target)
    puts "#{self.name} is letting it rip on #{target.name} with their #{@weapon}!"
    diceroll(4, 10)
    puts "#{self.name} nerd-whirlwinds #{target.name} for #{@damage} points of damage! Whoa!"
    target.hurt(@damage)
    diceroll(1, 4)
    puts "#{self.name} finishes with a wide swing of the #{@weapon} for #{@damage} points of damage. Dang!"
      target.hurt(@damage)
    end
    # def basic_attack(target)
    #   diceroll(@dice_num, @dice_type)
    #   puts "#{self.name} attacks #{target.name} with their #{@weapon} for #{@damage} points of damage!\n"
    #   target.hurt(@damage)
    #   diceroll(1, 4)
    #   puts "#{self.name} flicks his weapon once more for #{@damage} points of damage!\n"
    #   target.hurt(@damage)
    # end
end


class Barbarian < Dude
end

class Cleric < Dude
  def toll_the_dead
    puts "#{@name} is casting Toll the Dead!"
    diceroll(2, 12)
  end
end

def start
  puts "*" * 80
  puts "Welcome to DnD Fight Club. Make a dude to fight with. Press Enter to begin."
  $stdin.gets.chomp
  creator
end
def creator
  include Rng
  include Combat
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
  puts "Excellent, so they fight with their #{dude1.weapon}, and it does #{dude1.dice_num} d#{dude1.dice_type} damage.\n"
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
  puts "Excellent, so they fight with their #{dude2.weapon}, and it does #{dude2.dice_num} d#{dude2.dice_type} damage.\n"
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
