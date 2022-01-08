require_relative 'main_methods'

module GenreModule
  include MainMethods

  def genre_list
    if @genres.length.zero?
      puts Rainbow("\n No genres entered yet.").red.bright
      puts Rainbow(' -----------------------').red.bright
    else
      puts Rainbow("\n List of all genres:\n").aqua.bright.underline
      @genres.each_with_index do |genre, index|
        puts Rainbow(" #{index + 1}. #{genre.name}").white.bright
        puts Rainbow("_______________________________________\n").aqua.bright
      end
    end
  end
end
