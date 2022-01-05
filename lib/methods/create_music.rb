require_relative '../classes/music'

class CreateMusic
  def initialize(music_album)
    @music_album = music_album
  end

  def create_music
    print "Enter musician: "
    author = gets.chomp

    print "Enter genre: "
    genre = gets.chomp

    print "Enter source: "
    source = gets.chomp

    print "Enter label: "
    label = gets.chomp

    print "Enter the year of release: "
    publish_date = gets.chomp
    
    print "Is it on Spotify? [Y/N] "
    on_spotify = gets.chomp.downcase == 'Y'

    created_music = MusicAlbum.new(publish_date = publish_date, on_spotify = on_spotify)
    @music_album.push(created_music)

    puts "Album has been created!"
  end
end
