class Source
  attr_accessor :name, :items

  def initialize(name)
    @id = Random.rand(1...1_000_000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.add_source(self)
  end
end