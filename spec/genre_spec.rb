require_relative '../lib/classes/genre'
require_relative '../lib/classes/music'

describe Genre do
  context 'testing Genre class' do
    it 'should create new genre instance correctly' do
      genre = Genre.new('Comedy')
      expect(genre.name).to eq 'Comedy'
    end

    it 'should add item' do
      genre = Genre.new('Indie')
      expect(genre.items).to eq []
      genre.add_item(MusicAlbum.new(true, '2020/12/12'))
      expect(genre.items[0].class.name).to eq 'MusicAlbum'
    end
  end
end
