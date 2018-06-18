module Txt_filter
  def filter
    if @country.downcase == "usa"
      puts Start::INFO
    end
    if @country.downcase == "the uk"
      Start::INFO.gsub('o', 'ou')
    end
  end
end


class Player
  include Txt_filter
  attr_accessor :name, :country
  def initialize(name, country)
    @name = name
    @country = country
  end
  def rename=(new_name)
    @name = new_name
  end
  def move=(country)
    @country = country
  end
  def who_am_i
    puts "I am #{@name} from my home country of #{@country}!"
  end
end


class Start
INFO =  "\n\nWere you in love with her?

    The question is in a way meaningless, she knows, but one must ask.
    Love in such situations is rarely real.
    Sex is the engine, exalting and ruining people, sex and frustration.
    Love is what people believe is worth the path of devastation.
    "
end


puts "Welcome to Dude Simulator. Do you want to make a dude?  y/n"
choice = $stdin.gets.chomp
if choice == "n"
  exit
end
puts "Excellent. First what is your name?"
name = $stdin.gets.chomp
puts "And where are you from, #{name}?"
country = $stdin.gets.chomp
player = Player.new(name, country)


puts "Alright #{player.name} from #{player.country}, I hope you enjoy your stay!"

puts player.filter
