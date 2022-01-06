require_relative '../classes/author'
require_relative '../classes/genre'
require_relative '../classes/label'
require_relative '../classes/book'
require_relative 'main_methods'

module CreateBook
  include MainMethods

  def save_book
    File.write('./json/book.json', JSON.dump(@books))
  end

  def read_books
    return unless File.exist?('./json/book.json')

    file = File.read('./json/book.json')
    file_data = JSON.parse(file)
    file_data.each do |book|
      book_instance = Book.new(book['publish_date'], book['cover_state'])
      @books.push(book_instance)
    end
  end

  def save_label
    File.write('./json/label.json', JSON.dump(@labels))
  end

  def read_label
    return unless File.exist?('./json/label.json')

    file = File.read('./json/label.json')
    file_data = JSON.parse(file)
    file_data.each do |label|
      new_label = Label.new(label['title'], label['color'])
      @labels.push(new_label)
    end
  end

  def create_book_list
    puts 'What date was the book released? '
    publish_date = gets.chomp

    print 'Is the cover in good state? Good/Bad: '
    state = gets.chomp

    new_book = Book.new(publish_date, state)

    add_author(new_book)
    add_genre(new_book)
    add_label(new_book)

    save_label

    @books.push(new_book)

    save_book

    puts Rainbow('Book created!').white.bright.bg(:green)
  end

  def book_list
    if @books.length.zero?
      puts Rainbow(" No books added yet!\n ").white.bright.underline.bg(:red)
    else
      puts Rainbow("List of books:\n").green.bright.underline
      @books.each_with_index do |book, index|
        puts "#{index}. Published on: #{book.publish_date}
        Publisher: #{book.publisher}
        Cover State: #{book.cover_state}"
      end
    end
  end
end
