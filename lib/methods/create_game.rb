require_relative '../classes/game'

class CreateGame
  def initialize(games)
    @games = games
  end

  def create_game
    print "Does game want to be played by several players? [Y/N] "
    multiplayer = gets.chomp.downcase == 'Y'

    print "Enter the last time played: "
    last_played_at = gets.chomp.to_i

    create_game = Game.new(multiplayer: multiplayer, last_played_at: last_played_at)
    @games.push(create_game)
    puts "Game has been entered!\n"
  end
end