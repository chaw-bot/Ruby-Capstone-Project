require_relative '../lib/classes/game'
require_relative '../lib/classes/item'
require 'json'
require 'date'

describe Game do
  context 'A test for the game class' do
    it 'should instanstiate the class Game' do
      game = Game.new('One player', '3 years ago', '2020/12/12')
      expect(game.multiplayer).to eql('One player')
      expect(game.last_played_at).to eql('3 years ago')
      expect(game.publish_date).to eql('2020/12/12')
    end
  end
end
