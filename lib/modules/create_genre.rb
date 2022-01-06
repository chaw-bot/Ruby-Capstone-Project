require_relative 'main_methods'

module GenreModule
  include MainMethods

  def genre_list
    if @genres.length.zero?
      puts Rainbow(' No genres entered yet. ').white.bright.bg(:red)
    else
      puts Rainbow(" List of all genres:\n ").green.bright.underline
      @genres.each_with_index do |genre, index|
        puts "#{index + 1}. #{genre.name}"
        puts '____________________________________________'
      end
    end
  end
end
