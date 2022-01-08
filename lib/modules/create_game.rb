require_relative '../classes/author'
require_relative '../classes/genre'
require_relative '../classes/label'
require_relative '../classes/game'
require_relative 'main_methods'
require_relative 'create_music'
require_relative 'create_book'

module CreateGame
  include MainMethods

  def save_game
    File.write('./json/game.json', JSON.dump(@games))
  end

  def read_games
    return unless File.exist?('./json/game.json')

    file = File.read('./json/game.json')
    file_data = JSON.parse(file)
    file_data.each do |game|
      game_instance = Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'])
      label_instance = Label.new(game['title'], game['color'])
      game_instance.label = label_instance
      @games.push(game_instance)
    end
  end

  def save_author
    File.write('./json/author.json', JSON.dump(@authors))
  end

  def read_author
    return unless File.exist?('./json/author.json')

    file = File.read('./json/author.json')
    file_data = JSON.parse(file)
    file_data.each do |author|
      new_author = Author.new(author['first_name'], author['last_name'])
      @authors.push(new_author)
    end
  end

  def create_game_list
    print "\n Enter the number of players: "
    number_of_players = gets.chomp

    print ' When last was the game played?(yyyy/mm/dd): '
    date_of = gets.chomp

    print ' When was the game published?(yyyy/mm/dd): '
    publish_date = gets.chomp

    new_game = Game.new(number_of_players, date_of, publish_date)

    add_author(new_game)
    add_genre(new_game)
    add_label(new_game)

    save_author
    save_genre
    save_label

    @games.push(new_game)

    save_game

    puts Rainbow("\n Game created!").indianred.bright
    puts Rainbow('-----------------').indianred.bright
  end

  def game_list
    if @games.length.zero?
      puts Rainbow("\n No games added yet!").red.bright
      puts Rainbow('----------------------').red.bright
    else
      puts Rainbow("\n List of games:\n").aqua.bright.underline
      @games.each_with_index do |game, index|
        puts " #{index + 1}. Game name: #{game.label.title}\n  - Number of players: #{game.multiplayer}\n  - Last played on: #{game.last_played_at}"
        puts Rainbow("__________________________________________\n").aqua.bright
      end
    end
  end
end
