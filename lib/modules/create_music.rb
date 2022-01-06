require_relative '../classes/author'
require_relative '../classes/genre'
require_relative '../classes/label'
require_relative '../classes/book'
require_relative '../classes/game'
require_relative '../classes/music'
require_relative 'main_methods'

module CreateMusic
  include MainMethods

  def save_album
    File.write('./json/album.json', JSON.dump(@music_albums))
  end

  def read_albums
    return unless File.exist?('./json/album.json')

    file = File.read('./json/album.json')
    file_data = JSON.parse(file)
    file_data.each do |album|
      album_instance = MusicAlbum.new(album['on_spotify'], album['date'])
      # label_instance = Label.new(album['title'], album['color'])
      # album_instance.label = label_instance
      @music_albums.push(album_instance)
    end
  end

  def save_genre
    File.write('./json/genre.json', JSON.dump(@genres))
  end

  def read_genre
    return unless File.exist?('./json/genre.json')

    file = File.read('./json/genre.json')
    file_data = JSON.parse(file)
    file_data.each do |genre|
      new_genre = Genre.new(genre['name'])
      @genres.push(new_genre)
    end
  end

  def create_music_album
    puts 'When was the release date? '
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

    puts Rainbow(' Album created! ').white.bright.bg(:green)
  end

  def album_list
    if @music_albums.length.zero?
      puts Rainbow(" No albums added yet!\n ").white.bright.bg(:red)
    else
      puts "List of Albums:\n"
      @music_albums.each_with_index do |album, index|
        puts "#{index}. Published on: #{album.publish_date}
        On Spotify #{album.on_spotify}"
      end
    end
  end
end
