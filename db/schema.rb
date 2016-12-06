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

ActiveRecord::Schema.define(version: 20161205232939) do

  create_table "gemstones", force: :cascade do |t|
    t.string  "shape"
    t.string  "size"
    t.string  "stone"
    t.string  "colortone"
    t.decimal "price",     precision: 10, scale: 2
    t.string  "gemtype"
    t.string  "brand"
  end

  create_table "toolcategories", force: :cascade do |t|
    t.string   "level1"
    t.string   "level2"
    t.string   "level3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tools", force: :cascade do |t|
    t.string   "title"
    t.text     "short_desc"
    t.text     "long_desc"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "toolcategory_id"
  end

end
