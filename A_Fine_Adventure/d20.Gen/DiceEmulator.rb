# RNG engine via dice emulation

module DiceEmulator
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
