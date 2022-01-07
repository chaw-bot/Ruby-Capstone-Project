require 'rainbow'
require_relative './lib/modules/create_music'
require_relative './lib/modules/create_genre'
require_relative './lib/modules/create_book'
require_relative './lib/modules/create_label'
require_relative './lib/modules/create_author'
require_relative './lib/modules/create_game'

class HomePage
  include CreateMusic
  include GenreModule
  include CreateBook
  include LabelModule
  include CreateGame
  include AuthorModule

  def initialize
    @authors = []
    @genres = []
    @labels = []
    @music_albums = []
    @books = []
    @games = []
  end

  def load_data
    read_albums
    read_genre
    read_books
    read_label
    read_games
    read_author
  end

  def menu
    Dir.mkdir 'json' unless Dir.exist? 'json'

    puts Rainbow("\nWelcome to your Catalog!\n").blue.bright.underline
    puts Rainbow('  Please choose your option: ').red.bright.underline.bg(:pink)

    @options = {
      ' 1': 'List all books        ',
      ' 2': 'List all labels       ',
      ' 3': 'List all music albums ',
      ' 4': 'List all genres       ',
      ' 5': 'List of games         ',
      ' 6': 'List all authors      ',
      ' 7': 'Add a music album     ',
      ' 8': 'Add a book            ',
      ' 9': 'Add a game            ',
      ' 10': 'Exit                 '
    }

    @options.each do |index, string|
      puts Rainbow("#{index} - #{string}").black.bright.bg(:pink)
    end

    puts "\nEnter option from above list: "
    gets.chomp.to_i
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def pick_option(input)
    case input
    when 1
      book_list
    when 2
      label_list
    when 3
      album_list
    when 4
      genre_list
    when 5
      game_list
    when 6
      author_list
    when 7
      create_music_album
    when 8
      create_book_list
    when 9
      create_game_list
    when 10
      puts Rainbow(' Bye! See you soon! ').white.bright.bg(:green)
      exit
    else
      puts Rainbow(' Invalid option! ').white.bright.bg(:red)
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def run
    loop do
      pick_option(menu)
    end
  end
end

def main
  app = HomePage.new
  app.load_data
  app.run
end

main
