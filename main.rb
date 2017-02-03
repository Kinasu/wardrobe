# require_relative "casualwear.rb"
require_relative "wardrobe.rb"

if File.exist? ("data/wear.txt")
  file = File.open("data/wear.txt", "r:UTF-8")
  @filelines = file.readlines
  file.close
  @filelines.map! {|s| s.gsub("\n", "")}
else
  puts "Файл не найден"
end

# Программа спрашивает у пользователя, какая сейчас температура, а потом генерирует
# подходящий набор одежды, по одной шмотке каждого типа. Например шапка из зайца,
# меховая куртка, теплые джинсы, зимние ботинки.

puts "Какая погода сейчас за окном?"
@weather = gets.to_i

puts "Можем предложить вам следующие вещи: "

wardrobe = Wardrobe.new(@filelines, @weather)
wardrobe.wear
wardrobe.sky
