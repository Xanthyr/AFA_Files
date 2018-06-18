class Game
  def initialize
    @steps_taken = 0
    start_game
  end

  def start_game
    puts "How many steps would you like to take?"
    goal = $stdin.gets.chomp.to_i
    loop do
      if goal <= @steps_taken.to_i
        puts "Congratulations you finished your #{goal} step journey with #{@steps_taken} steps!"
        exit
      end
      puts "You have taken #{@steps_taken} steps, how many more do you want to take?"
      steps_to_take = $stdin.gets.chomp.to_i
      @steps_taken += steps_to_take

    end
  end
end
Game.new