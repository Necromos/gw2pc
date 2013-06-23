class CreateWorldMaps < ActiveRecord::Migration
  def change
    create_table :world_maps do |t|
      t.string :name

      t.timestamps
    end
  end
end
