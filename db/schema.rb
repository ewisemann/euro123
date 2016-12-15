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

ActiveRecord::Schema.define(version: 20161215002606) do

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
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "toolcategory_id"
    t.string   "tool_img_file_name"
    t.string   "tool_img_content_type"
    t.integer  "tool_img_file_size"
    t.datetime "tool_img_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
