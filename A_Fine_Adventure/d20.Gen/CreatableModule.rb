module CreatableModule
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
    when self.wisdom && self.dexterity && self.constitution == character_stats_array.max
      puts "You have a zen air about you, and move very well and have some stamina. I suggest being a Monk."
    when self.charisma && self.strength == character_stats_array.max(2)
      puts "Your body stand as strong as your beliefs. I suggest being a Paladin."
    when self.wisdom && self.dexterity == character_stats_array.max(2)
      puts "You are agile and have good awareness. I suggest being a Ranger."
    when self.wisdom && self.constitution == character_stats_array.max(2)
      puts "You have high endurance and a pension for the divine. I suggest being a cleric."
    when self.strength == character_stats_array.max
      puts "You're pretty strong. You could make a good Barbarian, or Fighter."
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