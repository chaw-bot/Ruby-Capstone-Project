require 'json'
require_relative '../classes/author'
require_relative '../classes/genre'
require_relative '../classes/label'

module MainMethods
  def add_author(item)
    puts "Enter the authors full name:\n"
    print 'First name: '
    first_name = gets.chomp

    print 'Last name: '
    last_name = gets.chomp

    author_name = Author.new(first_name, last_name)
    author_name.add_item(item)
    @authors.push(author_name)
  end

  def add_genre(item)
    puts "Enter the genre of this item:\n"
    print 'Genre: '
    genre_name = gets.chomp

    genre = Genre.new(genre_name)
    genre.add_item(item)
    @genres.push(genre)
  end

  def add_label(item)
    puts "Enter the label details of the item:\n"
    print 'Title: '
    title = gets.chomp

    print 'Color: '
    color = gets.chomp

    label = Label.new(title, color)
    label.add_item(item)
    @labels.push(label)
  end
end
