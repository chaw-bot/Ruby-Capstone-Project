require_relative '../lib/classes/author'
require_relative '../lib/classes/game'

describe Author do
  context 'A test on the Author class' do
    it 'should create new Author instance correctly' do
      author = Author.new('Samuel Chaw', 'Willy Tee')
      expect(author.first_name).to eq ('Samuel Chaw')
      expect(author.last_name).to eq ('Willy Tee')
    end

    it 'should add an item' do
      author = Author.new('Stephen Ben', 'John Doe')
      expect(author.items).to eq []
      author.add_item(Game.new('Stephen Ben', '3 years ago', '2020/12/12'))
      expect(author.items[0].class.name).to eq 'Game'
    end
  end
end
