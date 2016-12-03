class What_to_wear

  def initialize(clothes)
    @clothes = clothes
  end

  def temperature(sky)
    case sky
    when (-40...-5) then @temp = "(-40,-5)"
    when (-5...20) then @temp = "(-5,+20)"
    when (20..40) then @temp = "(+20,+40)"
    end
  end

  def dressing
    cloth = []
    while @clothes.include?(@temp) do
      thing = @clothes.index(@temp)
      cloth << @clothes[thing - 2]
      @clothes.delete_at(thing)
    end
    puts cloth
  end

end
