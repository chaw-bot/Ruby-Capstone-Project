require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && @last_played_at > 2
  end

  def to_json(*_args)
    JSON.dump({
                # publisher: @publisher
                multiplayer: @multiplayer,
                last_played_at: @last_played_at
              })
  end
end
