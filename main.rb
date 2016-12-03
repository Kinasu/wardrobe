require_relative "what_to_wear.rb"
require_relative "wardrobe.rb"

puts "Какая сейчас температура за окном?"

@sky = gets.to_i

wardrobe = Wardrobe.new
wardrobe.open_files
wardrobe.clear

wear = What_to_wear.new(wardrobe.clothes)

wear.temperature(@sky)
sleep 1
puts
puts "Могу предложить Вам: "
wear.dressing
sleep 1
puts "Хорошей прогулки!:)"
