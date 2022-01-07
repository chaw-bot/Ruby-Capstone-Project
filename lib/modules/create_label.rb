require_relative 'main_methods'

module LabelModule
  include MainMethods

  def label_list
    if @labels.empty?
      puts Rainbow(' No labels entered yet. ').white.bright.bg(:red)
    else
      puts Rainbow(" List of all labels:\n ").green.bright.underline
      @labels.each_with_index do |label, index|
        puts "#{index + 1}. #{label.title}"
        puts '____________________________________________'
      end
    end
  end
end
