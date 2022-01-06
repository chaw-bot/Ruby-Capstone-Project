require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state, :publish_date

  def initialize(publish_date, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def to_json(*_args)
    JSON.dump({
                publish_date: @publish_date,
                cover_state: @cover_state
              })
  end
end
