# RNG engine via dice emulation
module Rng
def diceroll(rolls, dice)
  allRolls = []
 rolls.times do
   result = 1 + rand(dice)
   allRolls.push(result)
   @list_rolls = allRolls
   @allRolls = allRolls.sum
   @lowestRoll = @list_rolls.min
 end
  @damage = @allRolls + @ability_mod.to_i
  end
end


# Creation tools
module Creatable
  include Rng
  attr_accessor :name, :armor_class, :dice_num, :dice_type, :char_max_hp
  attr_accessor :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma
  BASE_STATS = {
      max_hp: 10,
      ability_mod: 1,
      :strength => 0,
      :dexterity => 0,
      :constitution => 0,
      :intelligence => 0,
      :wisdom => 0,
      :charisma => 0
  }

  $character_stats = {

  }


  def character_stats
    puts """
    STR: #{@strength} [#{self.modifier(self.strength)}]
    DEX: #{@dexterity} [#{self.modifier(self.dexterity)}]
    CON: #{@constitution} [#{self.modifier(self.constitution)}]
    INT: #{@intelligence} [#{self.modifier(self.intelligence)}]
    WIS: #{@wisdom} [#{self.modifier(self.wisdom)}]
    CHA: #{@charisma} [#{self.modifier(self.charisma)}]"""
  end

  def character_stats_array
    [@strength, @dexterity, @constitution, @intelligence, @wisdom, @charisma]
  end

  def modifier_array
    @mod_array = character_stats_array.map {|stat| modifier(stat)}
  end

   def base_stats_array
     ["STR:", "DEX:", "CON:", "INT:", "WIS:", "CHA:"]
  #   ["STR : #{@strength}",
  #    "DEX : #{@dexterity}",
  #    "CON : #{@constitution}",
  #    "INT : #{@intelligence}",
  #    "WIS : #{@wisdom}",
  #    "CHA : #{@charisma}"]
   end

  def brute_force_stats
    reroll_counter = 1
    until character_stats_array.sum >= 90
      roll_all_stats
      reroll_counter += 1
    end
    $results.push(reroll_counter)
    reroll_counter
    $results
  end

  def roll_hp(dice_num, dice_type, extra = 0)
    set_hp(diceroll(dice_num, dice_type) + self.constitution.to_i)
    puts "You rolled a #{dice_num}d#{dice_type} for #{@list_rolls}, with a"
    print "#{self.modifier(self.constitution)} CON modifier, totalling #{self.hit_points}\n"
    if extra != 0
      print "#{extra} flat HP has been added as well, totalling #{self.hit_points += extra}"
    end
  end

  def roll_stat
    diceroll(4, 6)
    @allRolls - @lowestRoll
  end

  def roll_all_stats
    self.strength = (roll_stat)
    puts "For Strength, you rolled #{@list_rolls}, totaling #{@allRolls}, removing the lowest roll [#{@lowestRoll}] leaves a total of #{@allRolls - @lowestRoll}"
    self.dexterity = (roll_stat)
    puts "For Dexeterity, you rolled #{@list_rolls}, totaling #{@allRolls}, removing the lowest roll [#{@lowestRoll}] leaves a total of #{@allRolls - @lowestRoll}"
    self.constitution = (roll_stat)
    puts "For Constitution, you rolled #{@list_rolls}, totaling #{@allRolls}, removing the lowest roll [#{@lowestRoll}] leaves a total of #{@allRolls - @lowestRoll}"
    self.intelligence = (roll_stat)
    puts "For Intelligence, you rolled #{@list_rolls}, totaling #{@allRolls}, removing the lowest roll [#{@lowestRoll}] leaves a total of #{@allRolls - @lowestRoll}"
    self.wisdom = (roll_stat)
    puts "For Wisdom, you rolled #{@list_rolls}, totaling #{@allRolls}, removing the lowest roll [#{@lowestRoll}] leaves a total of #{@allRolls - @lowestRoll}"
    self.charisma = (roll_stat)
    puts "For Charisma, you rolled #{@list_rolls}, totaling #{@allRolls}, removing the lowest roll [#{@lowestRoll}] leaves a total of #{@allRolls - @lowestRoll}"
    puts "#{character_stats_array} totals to #{character_stats_array.sum}"
  end

  def suggest_class
    if self.constitution == character_stats_array.min
      puts "\n**Your stamina is questionable, getting into melee could be an issue.**\n"
    end

    puts "\n"
    case
    when self.strength && self.constitution == character_stats_array.max(2)
      puts "You are one beefy dude, you look like you could take a mad beating. I suggest being a Barbarian."
    when self.wisdom && self.dexterity && self.constitution == character_stats_array.max(3)
      puts "You have a zen air about you, and move very well and have some stamina. I suggest being a Monk."
    when self.charisma && self.strength == character_stats_array.max(2)
      puts "Your body stand as strong as your beliefs. I suggest being a Paladin."
    when self.wisdom && self.dexterity == character_stats_array.max(2)
      puts "You are agile and have good awareness. I suggest being a Ranger."
    when self.strength == character_stats_array.max
      puts "You're pretty strong. You could make a good Barbarian, or Fighter."
    when self.wisdom && self.constitution == character_stats_array.max(2)
      puts "You have high endurance and a pension for the divine. I suggest being a cleric."
    when self.dexterity == character_stats_array.max
      puts "You can move with grace. You could make a good Rogue, Ranger, Monk or Fighter."
    when self.intelligence == character_stats_array.max
      puts "You're pretty smart. You could make a good Wizard"
    when self.wisdom == character_stats_array.max
      puts "Your insight has value to it. You could make a good Cleric or Druid."
    when self.charisma == character_stats_array.max
      puts "You have strong force of personality and commanding presence. You could make a good Bard, Warlock, or Sorcerer."
    end
  end

  def equip(name, dice_num, dice_type)
    @weapon, @dice_num, @dice_type = name, dice_num, dice_type
  end

  def weighted_armor_class
    @armor_class = 10 + (self.dexterity.to_i - 10) / 2
  end

  def weapon
    puts "#{@weapon} - #{@dice_num}d#{@dice_type}"
  end

  def set_main_stat
    @ability_mod = modifier(character_stats_array.max)
    puts "Your highest ability score is #{self.say_best_stat}#{character_stats_array.max}, which has a #{@ability_mod} modifier."
  end

  def say_best_stat
    base_stats_array[character_stats_array.each_with_index.max[1]]
  end


  def set_hp(health)
    @hit_points = health
    @char_max_hp = health
  end

  def quickstart
    puts "Alright let's get you set up with 100hp, 10 armorclass, and a weak attack (1d4 +1)."
    self.set_hp(100)
    self.equip("Broken Sword", 1, 4)
    self.roll_all_stats
    self.set_main_stat
    self.weighted_armor_class
    self.suggest_class
  end
end

# Combat/Object manipulation
module Combat
  include Rng

  def Combat.included(mod)
    attr_accessor :hit_points, :ability_mod, :weapon
  end


  def initialize_stats(stats)
    @stats = stats

    @hit_points = stats[:max_hp]
    @ability_mod = stats[:ability_mod]
  end

  def alive?
    @hit_points > 0
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
      puts "\n#{self.name} attacks #{target.name} with their #{@weapon} for [#{@list_rolls}#{@ability_mod}]=#{@damage} points of damage!\n"
      target.hurt(@damage)
      puts "\n"
    else
      puts "\n\n#{self.name} needed to roll at least #{target.armor_class}, but they rolled a #{@damage}! The attack whiffs! finlevThump!\n"
    end
  end

  def throwdown(target)
    turns = 1
    puts "\nOh shit! #{self.name} and #{target.name} are throwing down hard!"
    while self.alive? && target.alive?
      self.basic_attack(target)
      if self.alive? == false && target.alive?
        puts "Yo, #{self.name} just got dunked on super hard!\n\n"
      end
      if target.alive? == false
        puts "Yo, #{target.name} just got dunked on super hard! It took #{turns} turns!\n\n"
        $results.push(self.name)
        puts self.status
        puts target.status
      end
      break unless self.alive? && target.alive?
      target.basic_attack(self)
      turns += 1
    end
  end
end
$results = []

# Change Stat Mods
module CharacterClasses
  # include Rng
  # include Creatable

  BASE_CLASSES = {
    :barbarian => @strength,
    :bard => @charisma,
    :cleric => @wisdom,
    :druid => @wisdom,
    :fighter => @strength,
    :monk => @dexterity,
    :paladin => @strength,
    :ranger => @dexterity,
    :rogue => @dexterity,
    :sorcerer => @charisma,
    :warlock => @charisma,
    :wizard => @intelligence
  }

  def modifier(score)
    modifier = (score.to_i - 10) / 2
    if modifier.positive? || modifier == 0
      return "+#{modifier}"
      else return modifier
    end
  end
end

class Dude
  include Combat
  include Rng
  include Creatable
  include CharacterClasses
  MAX_HP = 9999
  def initialize(name)
    @name = name
    initialize_stats(BASE_STATS.merge ({
        max_hp: MAX_HP
    }))
  end

  def status
    puts "*" * 80
    puts self.name
    puts self.class
    puts "Hitpoints: #{@hit_points}/#{self.char_max_hp}"
    puts "Armor Class: #{@armor_class}"
    puts "#{@weapon} - #{dice_num}d#{dice_type}"
    puts "Primary Ability Modifier: #{self.say_best_stat.gsub(":", "")}"
    puts character_stats
    puts "*" * 80
  end
end


class Target < Dude
end
class Wizard < Dude
  def fireball(target)
    puts "#{self.name} is casting Fireball towards #{target.name}!"
    diceroll(3, 6)
    puts "#{target.name} is fireballed for [#{@list_rolls}+#{@ability_mod}]=#{@damage} damage!"
    target.hurt(@damage)

  end
end

class Fighter < Dude
    def beyblade(target)
    puts "#{self.name} is letting it rip on #{target.name} with their #{@weapon}!"
    4.times do
    self.basic_attack(target)
  end
    diceroll(1, 4)
    puts "#{self.name} finishes with a wide swing of the #{@weapon} for [#{@list_rolls}+#{@ability_mod}]=#{@damage} points of damage. Dang!"
      target.hurt(@damage)
    end
end


class Barbarian < Dude
end

class Cleric < Dude
  def toll_the_dead(target)
    puts "#{self.name} is casting Toll the Dead on #{target.name}!"
    diceroll(2, 12)
  end
  def cure_wounds(target, lvl)
    puts "#{self.name} is casting a level #{lvl} Cure Wounds on #{target.name}!"
    diceroll(lvl, 8)
    target.heal(@damage)
    puts "#{target.name} is healed for #{@list_rolls}+#{@ability_mod}=#{@damage} health points!"
  end
end

