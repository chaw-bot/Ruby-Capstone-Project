require_relative '../classes/author'
require_relative '../classes/genre'
require_relative '../classes/label'
require_relative '../classes/book'
require_relative '../classes/game'
require_relative '../classes/music'
require_relative '../modules/methods'

class CreateItems
  include MainMethods

  def create_music_album
    print 'When was it released?(date) '
    publish_date = gets.chomp

    print 'Is it on Spotify?(true/false)'
    spotify = gets.chomp

    new_album = MusicAlbum.new(spotify, publish_date)

    add_author(new_album)
    add_genre(new_album)
    add_label(new_album)

    save_genre

    @music_albums.push(new_album)

    save_album

    puts 'Album created!'
  end

  def album_list
    if @music_albums.length.zero?
      puts 'No albums added yet!'
    else
      puts "List of Albums:\n"
      @music_albums.each_with_index do |album, index|
        print "#{index}. "
        print "Published on: #{album.publish_date}. "
        print "On Spotify #{album.on_spotify}. "
      end
    end
  end
end
