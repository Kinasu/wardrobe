require 'wardrobe'
require 'clothes_item'

describe Wardrobe do
  let(:wardrobe) { Wardrobe.new(File.dirname(__FILE__) + '/data/') }

  context 'Chooses things by season' do
    it 'clothes_items_types returns types' do
      expect(wardrobe.clothes_items_types)
        .to match_array(["головной убор", "верхняя одежда", "обувь", "брюки"])
    end

    it 'by_type returns an array of things' do
      expect(wardrobe.by_type("брюки").map(&:type))
        .to match_array(["брюки", "брюки", "брюки"])
    end

    it 'sky returns an array of things suitable for temperature' do
      expect(wardrobe.sky(-10).map(&:temperature_range).uniq)
        .to match_array([-40..-5, -10..30, -40..-10, -15..15, -15..20, -20..20])
    end

    it 'suit returns an array of sample things suitable for temperature' do
      expect(wardrobe.suit(-10).map(&:type))
        .to match_array(["головной убор", "верхняя одежда", "обувь", "брюки"])
    end
  end

end
