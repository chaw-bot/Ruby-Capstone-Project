require_relative 'main_methods'

module AuthorModule
  include MainMethods

  def author_list
    if @authors.length.zero?
      puts Rainbow("\n No authors entered yet.").red.bright
      puts Rainbow(' -----------------------').red.bright
    else
      puts Rainbow("\n List of all authors:\n").aqua.bright.underline
      @authors.each_with_index do |author, index|
        puts Rainbow(" #{index + 1}. #{author.first_name} #{author.last_name}").white.bright
        puts Rainbow("_______________________________________\n").aqua.bright
      end
    end
  end
end
