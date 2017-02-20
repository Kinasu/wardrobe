require_relative "wardrobe.rb"
require_relative "clothes_item.rb"

#Путь файла
path_data_dir = File.dirname(__FILE__) + "/data/"

puts "Какая погода сейчас за окном?"
weather = gets.to_i

puts "Можем предложить вам следующие вещи: "

wardrobe = Wardrobe.new(path_data_dir)

sky = wardrobe.suit(weather)
types = wardrobe.clothes_items_types

kit = []

types.each do |type|
	kit = wardrobe.items_of_type(type)
	new_kit = kit & sky
	new_kit = new_kit.sample 
	puts "#{new_kit.name}\n#{new_kit.type}\n#{new_kit.temperature_range}"
end
