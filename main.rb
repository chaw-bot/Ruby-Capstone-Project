require_relative './lib/modules/create_music'
require_relative './lib/modules/create_genre'

class HomePage
  include CreateMusic
  include GenreModule

  def initialize
    @authors = []
    @genres = []
    @labels = []
    @music_albums = []
  end

  def load_data
    read_albums
    read_genre
  end

  def menu
    Dir.mkdir 'json' unless Dir.exist? 'json'

    puts "\nWelcome to your Catalog!\n"
    puts "Please choose your option:\n"

    @options = {
      '1': 'List all books',
      '2': 'List all labels',
      '3': 'List all music albums',
      '4': 'List all genres',
      '5': 'List of games',
      '6': 'List all authors',
      '7': 'Add a music album',
      '8': 'Add a book',
      '9': 'Add a game',
      '10': 'Exit'
    }

    @options.each do |index, string|
      puts "#{index} - #{string}"
    end

    puts "\nEnter option from above list: "
    gets.chomp.to_i
  end

  def pick_option(input)
    case input
    when 1
      puts '1'
    when 2
      puts '2'
    when 3
      album_list
    when 4
      genre_list
    when 5
      puts '5'
    when 6
      puts '6'
    when 7
      create_music_album
    when 8
      puts '8'
    when 9
      puts '9'
    when 10
      puts 'Bye! See you soon!'
      exit
    else
      puts 'Invalid option'
    end
  end

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
