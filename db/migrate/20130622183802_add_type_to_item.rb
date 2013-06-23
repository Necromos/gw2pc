class AddTypeToItem < ActiveRecord::Migration
  def change
    add_column :items, :type_id, :integer
  end
end
