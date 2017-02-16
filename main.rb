require_relative "wardrobe.rb"

path_data_files = File.dirname(__FILE__) + "/data/"
files = Dir.entries(path_data_files)

#создаем пустой массив для хранения вещей
goods = []

for file in files
  if file.include?(".txt")
    file_data = File.new(path_data_files + file, 'r:UTF-8')

    #читаем в файле каждую строку и записываем ее в переменную
    filelines = file_data.readlines
    file_data.close
    filelines.map! {|s| s.gsub("\n", "")}
    #каждую строку передаем в массив с вещами
    goods << [filelines[0],filelines[1],filelines[2]]
  end
end

p goods
# if File.exist? ("data/wear.txt")
#   file = File.open("data/wear.txt", "r:UTF-8")
#   @filelines = file.readlines
#   file.close
#   @filelines.map! {|s| s.gsub("\n", "")}
# else
#   puts "Файл не найден"
# end

# Программа спрашивает у пользователя, какая сейчас температура, а потом генерирует
# подходящий набор одежды, по одной шмотке каждого типа. Например шапка из зайца,
# меховая куртка, теплые джинсы, зимние ботинки.

puts "Какая погода сейчас за окном?"
weather = gets.to_i

puts "Можем предложить вам следующие вещи: "

wardrobe = Wardrobe.new(goods, weather)
wardrobe.sky
wardrobe.itemcloth
