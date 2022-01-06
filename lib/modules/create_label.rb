require_relative 'main_methods'

module LabelModule
  include MainMethods

  def label_list
    if @labels.empty?
      puts 'No labels entered yet.'
    else
      puts "List of all labels:\n"
      @labels.each_with_index do |label, index|
        puts "#{index}. #{label.title}"
      end
    end
  end
end
