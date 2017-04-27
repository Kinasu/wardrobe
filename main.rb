require './lib/wardrobe.rb'
require './lib/clothes_item.rb'

puts 'Какая погода сейчас за окном?'
weather = gets.to_i

puts 'Можем предложить вам следующие вещи: '

wardrobe = Wardrobe.new(File.dirname(__FILE__) + '/data/')

wardrobe.suit(weather).each do |item|
  puts "#{item.name}\n#{item.type}\n#{item.temperature_range}"
end
