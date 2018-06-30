module CharacterClasses

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