class ItemsRecipes < ActiveRecord::Base
  belongs_to :item
  belongs_to :recipe
end
