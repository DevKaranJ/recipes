require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:recipe) }
    it { is_expected.to belong_to(:food) }
  end
end
