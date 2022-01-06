require_relative 'mainMethods'

module GenreModule
  include MainMethods

  def genre_list
    if @genres.length.zero?
      puts 'No genres entered yet.'
    else
      puts "List of all genres:\n"
      @genres.each_with_index do |genre, index|
        puts "#{index}. #{genre.name}"
      end
    end
  end
end