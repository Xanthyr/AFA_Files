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
# end
#
# module Combat
#   include Rng
#   BASE_STATS = {
#       max_hp: 10,
#       ability_mod: 1
#   }
#
#   def Combat.included(mod)
#     attr_accessor :hit_points, :ability_mod
#   end
#
#   def initialize_stats(stats)
#     @stats = stats
#
#     @hit_points = stats[:max_hp]
#     @ability_mod = stats[:ability_mod]
#   end
#
#   def alive?
#     @hit_points > 0
#   end
#
#   def set_armor(armor_class)
#     @armor_class = armor_class
#   end
#
#   def armor_class
#     @armor_class
#   end
#
#
#   def hurt(amount)
#     @hit_points -= amount
#     puts "#{@name} has #{@hit_points} health remaining!"
#   end
#
#   def heal(amount)
#     @hit_points += amount
#     @hit_points = [@hit_points, @stats[:max_hp]].min
#   end
#   def basic_attack(target)
#     puts "#{self.name} attacks #{target.name} with their #{@weapon}!"
#     diceroll(1, 20)
#     if @damage >= target.armor_class
#       puts "\n\n#{self.name} needed to roll at least #{target.armor_class}, and they rolled a #{@damage}! The attack hits!"
#       diceroll(@dice_num, @dice_type)
#       puts "#{self.name} attacks #{target.name} with their #{@weapon} for #{@damage} points of damage!\n"
#       target.hurt(@damage)
#       puts "\n"
#     else
#       puts "\n\n#{self.name} needed to roll at least #{target.armor_class}, but they rolled a #{@damage}! The attack whiffs! finlevThump!"
#     end
#   end
#   def throwdown(target)
#     puts "\nOh shit! #{@name} and #{target.name} are throwing down hard!"
#     while self.alive? && target.alive?
#       self.basic_attack(target)
#       if self.alive? == false && target.alive
#         puts "Yo, #{self.name} just got dunked on super hard!\n\n"
#       end
#       if target.alive? == false
#         puts "Yo, #{target.name} just got dunked on super hard!\n\n"
#       end
#       break unless self.alive? && target.alive?
#       target.basic_attack(self)
#     end
#   end
# end

class Dude
  # include Combat
  include Rng
  MAX_HP = 30
  def initialize(name)
    @name = name
    initialize_stats(BASE_STATS.merge ({
        max_hp: MAX_HP
    }))
  end
  def equip(name, dice_num, dice_type)
    @weapon, @dice_num, @dice_type = name, dice_num, dice_type
  end
  def ability_mod(modifier)
    @ability_mod = modifier
  end
  def name
    @name
  end
  def status
    puts "*" * 80
    puts "HP: #{@hit_points}/#{MAX_HP}"
    puts "AP: #{@ability_mod}"
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
end


class Barbarian < Dude
end

class Cleric < Dude
  def toll_the_dead
    puts "#{@name} is casting Toll the Dead!"
    diceroll(2, 12)
  end
end
