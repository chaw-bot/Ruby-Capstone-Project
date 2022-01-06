require_relative '../classes/author'
require_relative '../classes/genre'
require_relative '../classes/label'
require_relative '../classes/book'
require_relative 'main_methods'

module CreateBook
  include MainMethods

  # def save_album
  #   File.write('./json/album.json', JSON.dump(@music_albums))
  # end

  # def read_albums
  #   return unless File.exist?('./json/album.json')

  #   file = File.read('./json/album.json')
  #   file_data = JSON.parse(file)
  #   file_data.each do |album|
  #     album_instance = MusicAlbum.new(album['on_spotify'], album['date'])
  #     # label_instance = Label.new(album['title'], album['color'])
  #     # album_instance.label = label_instance
  #     @music_albums.push(album_instance)
  #   end
  # end

  # def save_genre
  #   File.write('./json/genre.json', JSON.dump(@genres))
  # end

  # def read_genre
  #   return unless File.exist?('./json/genre.json')

  #   file = File.read('./json/genre.json')
  #   file_data = JSON.parse(file)
  #   file_data.each do |genre|
  #     new_genre = Genre.new(genre['name'])
  #     @genres.push(new_genre)
  #   end
  # end

  def create_book_list
    puts 'What date was the book released? '
    publish_date = gets.chomp

    print 'Is the cover in good state?(Yes/No)'
    state = gets.chomp

    new_book = Book.new(publish_date, state)

    add_author(new_book)
    add_genre(new_book)
    add_label(new_book)

    # save_genre

    @books.push(new_book)

    # save_album

    puts 'Book created!'
  end

  def book_list
    if @books.length.zero?
      puts "No books added yet!\n"
    else
      puts "List of books:\n"
      @books.each_with_index do |book, index|
        puts "#{index}. Published on: #{book.publish_date} Publisher: #{book.publisher} Cover State: #{book.cover_state}"
      end
    end
  end
end
