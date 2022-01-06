require_relative 'main_methods'

module AuthorModule
  include MainMethods

  def author_list
    if @authors.length.zero?
      puts Rainbow(' No authors entered yet. ').white.bright.bg(:red)
    else
      puts Rainbow(" List of all authors:\n ").green.bright.underline
      @authors.each_with_index do |author, index|
        puts "#{index + 1}. #{author.first_name} #{author.last_name}"
        puts '____________________________________________'
      end
    end
  end
end
