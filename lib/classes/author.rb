class Author
  attr_accessor :first_name, :last_name, :id
  attr_reader :items

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push item
    item.add_author self
  end

  def to_json(*_args)
    JSON.dump({
                # publisher: @publisher
                first_name: @first_name,
                last_name: @last_name
              })
  end
end
