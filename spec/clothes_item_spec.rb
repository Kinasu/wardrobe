require 'clothes_item'

describe ClothesItem do
  let(:clothes_item) { ClothesItem.new("джинсы", "брюки", -15..30) }

  context 'Class clothes_item include information about things' do
    it 'initialize returns attribute of things' do
      expect(clothes_item.temperature_range).to eq -15..30
    end

    it 'suitable? does the given number is in the range of numbers' do
      expect(clothes_item.suitable?(5))
        .to be true
    end
  end
end
