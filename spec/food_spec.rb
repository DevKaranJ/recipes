require 'rails_helper'

RSpec.describe Food, type: :model do
  context 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:recipe_foods) }
    it { should have_many(:recipes).through(:recipe_foods) }
  end
end
