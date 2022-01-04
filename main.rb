class HomePage
  def menu
    puts "Welcome to your catalog!\n"
    puts "Please choose your option: "

    @options = {
      '1': 'Books',
      '2': 'Games',
      '3': 'Music',
      '4': 'Exit'
    }
    
    @options.each do |index, string|
      puts "#{index} - #{string}"
    end

    print "\nEnter option from above list: "
    gets.chomp.to_i
  end
end

def main
  app = HomePage.new
  app.menu
end

main
