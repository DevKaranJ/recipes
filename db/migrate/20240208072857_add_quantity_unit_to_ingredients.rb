class AddQuantityUnitToIngredients < ActiveRecord::Migration[7.1]
  def change
    add_column :ingredients, :quantity_unit, :string
  end
end
