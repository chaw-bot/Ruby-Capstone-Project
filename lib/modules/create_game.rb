require_relative '../classes/author'
require_relative '../classes/genre'
require_relative '../classes/label'
require_relative '../classes/game'
require_relative 'main_methods'

module CreateGame
  include MainMethods

  # def save_book
  #   File.write('./json/book.json', JSON.dump(@books))
  # end

  # def read_books
  #   return unless File.exist?('./json/book.json')

  #   file = File.read('./json/book.json')
  #   file_data = JSON.parse(file)
  #   file_data.each do |book|
  #     book_instance = Book.new(book['publish_date'], book['cover_state'])
  #     @books.push(book_instance)
  #   end
  # end

  # def save_label
  #   File.write('./json/label.json', JSON.dump(@labels))
  # end

  # def read_label
  #   return unless File.exist?('./json/label.json')

  #   file = File.read('./json/label.json')
  #   file_data = JSON.parse(file)
  #   file_data.each do |label|
  #     new_label = Label.new(label['title'], label['color'])
  #     @labels.push(new_label)
  #   end
  # end

  def create_game_list
    puts 'How many Players? '
    number_of_players = gets.chomp

    print 'When last was the game played?: '
    date_of = gets.chomp

    new_game = Game.new(number_of_players , date_of)

    add_author(new_game)
    add_genre(new_game)
    add_label(new_game)

    # save_label

    @games.push(new_game)

    # save_book

    puts Rainbow('Game created!').white.bright.bg(:green)
  end

  def game_list
    if @games.length.zero?
      puts Rainbow(" No games added yet!\n ").white.bright.underline.bg(:red)
    else
      puts Rainbow("List of games:\n").green.bright.underline
      @games.each_with_index do |game, index|
        puts "#{index + 1}. Number of players: #{game.multiplayer}\n
        -  Last played on: #{game.last_played_at}"
        puts '____________________________________________'
      end
    end
  end
end
