require_relative '../lib/classes/music'
require_relative '../lib/classes/item'
require 'json'

describe MusicAlbum do
  context 'testing MusicAlbum class' do
    it 'should instanstiate the class MusicAlbum' do
      music_album = MusicAlbum.new(true, '2020/12/12')
      expect(music_album.on_spotify).to eq true
      expect(music_album.publish_date).to eq Date.parse('2020/12/12')
    end

    it 'can be archived text' do
      music_album = MusicAlbum.new(true, '2020/12/12')
      expect(music_album.can_be_archived?).to eq false
    end
  end
end
