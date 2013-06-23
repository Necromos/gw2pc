class CreateItemsRecipes < ActiveRecord::Migration
  def change
    create_table :items_recipes do |t|
      t.references :item, index: true
      t.references :recipe, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
