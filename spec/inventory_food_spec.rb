require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:inventory) }
    it { is_expected.to belong_to(:food) }
  end
end