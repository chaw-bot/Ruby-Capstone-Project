require_relative '../classes/book'

class CreateBook
  def initialize(book)
    @book = book
  end

  def create_book
    print "Enter the author name: "
    author = gets.chomp
    
    print "Is the cover in good condition? [Y/N] "
    cover_state = gets.chomp.downcase == 'Y'

    created_music = MusicAlbum.new(publish_date = publish_date, cover_state = cover_state)
    @book.push(created_music)

    puts "Book has been created!"
  end
end
