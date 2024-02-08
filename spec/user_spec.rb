require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many(:recipes)}
    it { should have_many(:foods)}
    it { should have_many(:inventories)}
  end
end