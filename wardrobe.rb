class Wardrobe
  def initialize(filelines,weather)
    @filelines = filelines
    @weather = weather
  end

  def wear
    @counter = 3
    @line_counter = 0
    @clothes = []

    while @filelines.size > @counter
      @clothes << [@filelines[@line_counter], @filelines[@line_counter + 1], @filelines[@line_counter + 2]]
      @line_counter += 3
      @counter += 3
    end
  end


  def sky
    @clothes.each do |dress|
      @temp_range = dress[2].gsub(/[^\d,-]/, "").split(',').map{|d| Integer(d)}
      @range = @temp_range[0]..@temp_range[1]

      puts dress if @range.include?(@weather)
    end
  end
end
