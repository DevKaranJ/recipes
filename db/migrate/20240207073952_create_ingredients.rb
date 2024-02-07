class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.string :food_name
      t.float :quantity
      t.string :value
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
