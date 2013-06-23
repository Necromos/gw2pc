class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.references :item, index: true
      t.references :profession, index: true
      t.integer :level
      
      t.timestamps
    end
  end
end
