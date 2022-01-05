require_relative '../classes/game'

class CreateGame
  def initialize(game)
    @game = game
  end

  def create_game
    prints "Enter a game: "
    game = gets.chomp


  end
end
