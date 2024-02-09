class InventoryFood < ApplicationRecord
  belongs_to :inventory
  belongs_to :food

  attr_accessor :food_name
end
