require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  it { should belong_to(:inventory) }
  it { should belong_to(:food) }

  describe 'food_name attribute' do
    it 'can be set and retrieved' do
      inventory_food = InventoryFood.new
      inventory_food.food_name = 'Test Food'
      expect(inventory_food.food_name).to eq('Test Food')
    end
  end
end
