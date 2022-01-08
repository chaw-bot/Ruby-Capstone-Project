require_relative '../classes/author'
require_relative '../classes/genre'
require_relative '../classes/label'
require_relative '../classes/book'
require_relative 'main_methods'
require_relative 'create_game'
require_relative 'create_music'

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
      label_instance = Label.new(book['title'], book['color'])
      book_instance.label = label_instance
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
    print "\n On what date was the book released?(yyyy/mm/dd) "
    publish_date = gets.chomp

    print ' Is the cover in a good/bad state? '
    state = gets.chomp

    new_book = Book.new(publish_date, state)

    add_author(new_book)
    add_genre(new_book)
    add_label(new_book)

    save_label
    save_author
    save_genre

    @books.push(new_book)

    save_book

    puts Rainbow("\n Book created!").indianred.bright
    puts Rainbow('-----------------').indianred.bright
  end

  def book_list
    if @books.length.zero?
      puts Rainbow("\n No books added yet!").red.bright
      puts Rainbow('----------------------').red.bright
    else
      puts Rainbow("\n List of books:\n").aqua.bright.underline
      @books.each_with_index do |book, index|
        puts " #{index + 1}. Book title: #{book.label.title}\n  - Published on: #{book.publish_date}\n  - Cover State: #{book.cover_state}"
        puts Rainbow("__________________________________________\n").aqua.bright
      end
    end
  end
end
