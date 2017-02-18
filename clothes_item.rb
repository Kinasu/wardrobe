class ClothesItem
  attr_reader :name, :type, :temperature_range

  def initialize(name, type, temperature_range)
    @name = name
    @type = type
    @temperature_range = temperature_range
  end

  def suitable?(temperature)
    @temperature_range.include?(temperature)
  end
end
