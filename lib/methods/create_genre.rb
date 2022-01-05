require_relative '../classes/genre'

class CreateGenre
  def initialize(genres)
    @genres = genres
  end

  def create_genre
    prints "Enter a genre: "
    genre = gets.chomp

    create_genre = Genre.new(name: name)
    @genres.push(create_genre)
    puts "Genre entered!\n"
  end
end
