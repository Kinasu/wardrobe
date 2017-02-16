class Wardrobe
  def initialize(goods,weather)
    @goods = goods
    @weather = weather
  end


  def sky
    @wear = []
    @goods.each do |dress|
      @temp_range = dress[2].gsub(/[^\d,-]/, "").split(',').map{|d| Integer(d)}
      @range = @temp_range[0]..@temp_range[1]

      @wear << dress if @range.include?(@weather)
    end
  end

  def itemcloth
    puts @wear.uniq { |s| s[1] }
  end
end
