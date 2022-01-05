require_relative '../classes/author'
require_relative '../classes/genre'
require_relative '../classes/label'
require_relative '../classes/source'

module MainMethods
  def create_author
    puts "\n Add a new author: "
    print "\n First name: "
    first_name = gets.chomp
    print "\n Last name: "
    last_name = gets.chomp

    Author.new(first_name, last_name)
  end

  def create_genre
    puts "\n Add a new genre: "
    genre = gets.chomp

    Genre.new(genre)
  end

  def create_label
    puts "\n Add a new label: "
    print "\n Label title: "
    label_title = gets.chomp
    print "\n Label color: "
    label_color = gets.chomp

    Label.new(label_title, label_color)
  end

  def create_source
    puts "\n Add a new source: "
    source_name = gets.chomp

    Source.new(source_name)
  end
end
