class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :items
  has_many :items_recipes, :dependent => :destroy
  belongs_to :item
  belongs_to :profession
  belongs_to :rarity
end
