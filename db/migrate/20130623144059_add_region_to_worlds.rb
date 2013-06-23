class AddRegionToWorlds < ActiveRecord::Migration
  def change
    add_column :worlds, :region, :string
  end
end
