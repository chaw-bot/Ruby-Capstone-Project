require_relative '../classes/author'
require_relative '../classes/genre'
require_relative '../classes/label'
require_relative '../classes/source'
require_relative '../classes/book'
require_relative '../classes/game'
require_relative '../classes/music'
require_relative '../modules/methods'

class CreateItems
  include MainMethods

  def create_music
    puts "\nSelect a genre from the list below or add new genre: "
    genre = create_genre
    genre = gets.chomp

    puts "When was the album released(year)? "
    release_date = gets.chomp

    print "Is the album on Spotify? "
    puts '1 - Yes'
    puts '2 - No'
    on_spotify = gets.chomp.to_i

    created_music = MusicAlbum.new(release_date, on_spotify)
    @music_album.push(created_music)

    puts "Album has been created!"
  end
end
