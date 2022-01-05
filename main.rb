require_relative './lib/methods/create_items'

class HomePage
  def initialize
    @create_items = CreateItems.new
  end

  def menu
    puts "\nWelcome to your catalog!\n"
    puts 'Please choose your option: '

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

    print "\nEnter option from above list: "
    gets.chomp.to_i
  end

  def pick_option(input)
    case input
    when 1
      puts '1'
    when 2
      puts '2'
    when 3
      puts '3'
    when 4
      puts '4'
    when 5
      puts '5'
    when 6
      puts '6'
    when 7
      @create_items.create_music
    when 8
      @create_book.create_book
    when 9
      @create_game.create_game
    when 10
      puts 'Exit'
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
  app.run
end

main
