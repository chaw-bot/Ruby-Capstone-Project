require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date
  attr_reader :items

  def initialize(on_spotify, publish_date)
    super(publish_date)
    @id = Random.rand(1..1000)
    @on_spotify = on_spotify
    @items = []
  end

  def can_be_archived?
    @on_spotify && super
  end

  def to_json(*_args)
    JSON.dump({
                spotify: @on_spotify,
                date: @publish_date,
                #title: @label.title
                # title: @label.title
              })
  end
end
