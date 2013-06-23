# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130623151320) do

  create_table "events", force: true do |t|
    t.string   "key"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.integer  "rarity_id"
    t.integer  "level"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_id"
  end

  add_index "items", ["rarity_id"], name: "index_items_on_rarity_id", using: :btree

  create_table "items_recipes", force: true do |t|
    t.integer  "item_id"
    t.integer  "recipe_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items_recipes", ["item_id"], name: "index_items_recipes_on_item_id", using: :btree
  add_index "items_recipes", ["recipe_id"], name: "index_items_recipes_on_recipe_id", using: :btree

  create_table "professions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "professions", ["name"], name: "index_professions_on_name", unique: true, using: :btree

  create_table "rarities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rarities", ["name"], name: "index_rarities_on_name", unique: true, using: :btree

  create_table "recipes", force: true do |t|
    t.integer  "item_id"
    t.integer  "profession_id"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipes", ["item_id"], name: "index_recipes_on_item_id", using: :btree
  add_index "recipes", ["profession_id"], name: "index_recipes_on_profession_id", using: :btree

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "world_maps", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "worlds", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "region"
  end

end
