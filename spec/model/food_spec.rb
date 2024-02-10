require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'associations' do
    it 'should have many recipe_foods' do
      expect(Food.reflect_on_association(:inventory_foods).macro).to eq(:has_many)
    end

    it 'should belong to a user' do
      expect(Food.reflect_on_association(:user).macro).to eq(:belongs_to)
    end
  end
end
