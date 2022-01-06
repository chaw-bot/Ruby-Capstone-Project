require_relative 'main_methods'

module GenreModule
  include MainMethods

  def genre_list
    if @genres.length.zero?
      puts Rainbow(' No genres entered yet. ').white.bright.bg(:red)
    else
      puts "List of all genres:\n"
      @genres.each_with_index do |genre, index|
        puts "#{index}. #{genre.name}"
      end
    end
  end
end
