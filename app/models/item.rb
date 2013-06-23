class Item < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  has_many :items_recipes, :dependent => :destroy
  belongs_to :rarity
  belongs_to :type
end
