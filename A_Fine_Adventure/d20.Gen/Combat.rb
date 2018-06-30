module Combat
  include DiceEmulator

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
