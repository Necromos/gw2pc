class AddLevelAndMapAndGroupAndMapwideToEvents < ActiveRecord::Migration
  def change
    add_column :events, :level, :integer
    add_column :events, :world_map_id, :integer
    add_column :events, :group, :bool
    add_column :events, :mapwide, :bool
  end
end
