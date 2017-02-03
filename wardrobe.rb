class Wardrobe
  def initialize(filelines,weather)
    @filelines = filelines
    @weather = weather
  end

  def wear
    @counter = 2
    @line_counter = 0
    @clothes = []
    while @filelines.size > @counter
      @clothes << [@filelines[@line_counter], @filelines[@line_counter + 1], @filelines[@line_counter + 2]]

      @line_counter += 3
      @counter += 2
    end
  end

  def sky
    @dress_count = 2
    @clothes.each do |dress|
      temp_range = dress[@dress_count].gsub(/[^\d,-]/, "").split(',').map{|d| Integer(d)}
      if (temp_range[0]..temp_range[1]).include?(@weather)
        puts dress
      else
        false
      end
      @dress_count += 3
    end
  end
end
