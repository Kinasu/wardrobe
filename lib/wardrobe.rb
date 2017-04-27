class Wardrobe
  def initialize(path_data_dir)
    files = Dir.entries(path_data_dir)
    @clothes_items = [] # create an empty array to store things

    for file in files
      file_data = File.new(path_data_dir + file, 'r:UTF-8')
      if file.include?('.txt')
        # read each line and write in variable
        filelines = file_data.readlines.map(&:chomp)
        file_data.close
        # find temperature range
        temp_range = filelines[2].delete("()").split(',').map(&:to_i)
        # pass each line to an array
        @clothes_items << ClothesItem.new(
          filelines[0], filelines[1], temp_range[0]..temp_range[1]
        )
      end
    end
  end

  # sorting things by type
  def by_type(type)
    @clothes_items.select { |item| item.type == type }
  end

  # sorting item by whether( temperature )
  def sky(temperature)
    @clothes_items.select { |item| item.suitable?(temperature) }
  end

  # method selects a random item from each type
  def suit(temperature)
    clothes_items_types.map { |type| (by_type(type) & sky(temperature).flatten)
      .sample }
  end

  # types of things
  def clothes_items_types
    @clothes_items.map(&:type).uniq!
  end
end
