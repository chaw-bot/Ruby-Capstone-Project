require_relative 'main_methods'

module LabelModule
  include MainMethods

  def label_list
    if @labels.empty?
      puts Rainbow("\n No labels entered yet.").red.bright
      puts Rainbow(' -----------------------').red.bright
    else
      puts Rainbow("\n List of all labels:\n").aqua.bright.underline
      @labels.each_with_index do |label, index|
        puts Rainbow(" #{index + 1}. #{label.title}").white.bright
        puts Rainbow("_______________________________________\n").aqua.bright
      end
    end
  end
end
