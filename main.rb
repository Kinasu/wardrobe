require_relative "wardrobe.rb"
require_relative "clothes_item.rb"

#Путь файла
path_data_dir = File.dirname(__FILE__) + "/data/"

puts "Какая погода сейчас за окном?"
weather = gets.to_i

puts "Можем предложить вам следующие вещи: "

wardrobe = Wardrobe.new(path_data_dir)

wardrobe.suit(weather)
