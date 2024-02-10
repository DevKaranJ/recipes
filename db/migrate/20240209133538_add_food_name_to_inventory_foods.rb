class AddFoodNameToInventoryFoods < ActiveRecord::Migration[7.1]
  def change
    add_column :inventory_foods, :food_name, :string
  end
end
