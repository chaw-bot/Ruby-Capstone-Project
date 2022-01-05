require_relative '../classes/game'

class CreateGame
  def initialize(games)
    @games = games
  end

  def create_game
    prints "Enter a game: "
    game = gets.chomp

    create_game = Game.new(multiplayer: multiplayer, last_played_at: last_played_at)
    @games.push(create_game)
    puts "Game has been entered!\n"
  end
end