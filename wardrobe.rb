class Wardrobe
  def initialize(path_data_dir)
    files = Dir.entries(path_data_dir)

    #создаем пустой массив для хранения вещей
    @clothes_items = []

    for file in files
      file_data = File.new(path_data_dir + file, 'r:UTF-8')
      if file.include?(".txt")
        #читаем в файле каждую строку и записываем ее в переменную
        filelines = file_data.readlines
        file_data.close
        filelines.map! {|s| s.gsub("\n", "")}
        #каждую строку передаем в массив с вещами
        temp_range = filelines[2].gsub(/[^\d,-]/, "").split(',')
        .map{|d| d.to_i}
        @clothes_items << ClothesItem.new(
          filelines[0], filelines[1], temp_range[0]..temp_range[1]
        )
      end
    end
  end

  # Сортировка вещей по типу
  def items_of_type(type)
    @clothes_items.select { |item| item.type == type }
  end

  # Сортировка вещей по погоде(температуре), типам и
  # метод выбирает случайную вещь из каждого типа.
  def suit(temperature)
    sky = []
    kit = []

    @clothes_items.each do |item|
      sky << item if item.suitable?(temperature)
    end
    sky

    types = clothes_items_types
    types.each do |type|
      kit = items_of_type(type)
      new_kit = kit & sky
      new_kit = new_kit.sample
      puts "#{new_kit.name}\n#{new_kit.type}\n#{new_kit.temperature_range}"
    end
  end

  # Типы вещей
  def clothes_items_types
    @types = []
    @clothes_items.each { |item| @types << item.type }
    @types.uniq!
  end
end
