module Songlist
  SANTERIA = ["I don't practice Santeria", "I ain't got no crystal ball",
  "I had a million dollars, but I", "I spent it all"]
  BDAY = ["Happy birthday to you",
  "I don't want to get sued",
  "So I'll stop right there"]
  BULLS = ["They rally around tha family",
    "With pockets full of shells"]
end

# class Song
#
#   def initialize(lyrics)
#     @lyrics = lyrics
#   end
#
#   def sing_me_a_song()
#     @lyrics.each {|line| puts line }
#   end
#   def self.sing_again(array)
#     array.each {|line| puts line}
#   end
# end

class Jukebox
  include Songlist
  def play_song(array)
  array.each {|line| puts line}
  end
end

# happy_bday = Song.new(["Happy birthday to you",
# "I don't want to get sued",
# "So I'll stop right there"])
#
# bulls_on_parage = Song.new(["They rally around tha family",
#   "With pockets full of shells"])
#
# $santeria = ["I don't practice Santeria", "I ain't got no crystal ball",
# "I had a million dollars, but I", "I spent it all"]
#
#   happy_bday.sing_me_a_song()
#
#   bulls_on_parage.sing_me_a_song()
