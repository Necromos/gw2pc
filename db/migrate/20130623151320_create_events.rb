class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :key
      t.string :name

      t.timestamps
    end
  end
end
