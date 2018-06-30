require './DiceEmulator.rb'
require './CreatableModule.rb'
require './Combat.rb'
require './CharacterClasses.rb'
# Creation tools
# Combat/Object manipulation
$results = []

# Change Stat Mod

class Dude
  include Combat
  include DiceEmulator
  include CreatableModule
  include CharacterClasses
  attr_accessor :name, :armor_class, :dice_num, :dice_type, :char_max_hp
  MAX_HP = 9999
  def initialize(name)
    @name = name
    initialize_stats(BASE_STATS.merge({max_hp: MAX_HP}))
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

