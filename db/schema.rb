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

ActiveRecord::Schema.define(version: 20160329192635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attempts", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.integer  "minute"
    t.integer  "second"
    t.integer  "hundredths_of_second"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "season_id"
    t.integer  "user_id"
    t.datetime "deleted_at"
  end

  add_index "attempts", ["season_id"], name: "index_attempts_on_season_id", using: :btree

  create_table "drink_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.datetime "deleted_at"
    t.string   "english_name"
    t.integer  "user_id"
    t.integer  "number"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "drink_group_id"
  end

  add_index "drink_groups", ["drink_group_id"], name: "index_drink_groups_on_drink_group_id", using: :btree
  add_index "drink_groups", ["number", "name"], name: "index_drink_groups_on_number_and_name", using: :btree
  add_index "drink_groups", ["user_id"], name: "index_drink_groups_on_user_id", using: :btree

  create_table "drink_items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "english_name"
    t.text     "english_description"
    t.string   "price"
    t.datetime "deleted_at"
    t.integer  "drink_group_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.integer  "number"
    t.datetime "start_date"
    t.datetime "end_date"
  end

  add_index "drink_items", ["drink_group_id"], name: "index_drink_items_on_drink_group_id", using: :btree
  add_index "drink_items", ["number", "name"], name: "index_drink_items_on_number_and_name", using: :btree
  add_index "drink_items", ["user_id"], name: "index_drink_items_on_user_id", using: :btree

  create_table "menu_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "deleted_at"
    t.string   "english_name"
    t.integer  "number"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "user_id"
  end

  add_index "menu_groups", ["number", "name"], name: "index_menu_groups_on_number_and_name", using: :btree
  add_index "menu_groups", ["user_id"], name: "index_menu_groups_on_user_id", using: :btree

  create_table "menu_items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "english_name"
    t.text     "english_description"
    t.string   "price"
    t.datetime "deleted_at"
    t.integer  "menu_group_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "number"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "user_id"
  end

  add_index "menu_items", ["menu_group_id"], name: "index_menu_items_on_menu_group_id", using: :btree
  add_index "menu_items", ["number", "name"], name: "index_menu_items_on_number_and_name", using: :btree
  add_index "menu_items", ["user_id"], name: "index_menu_items_on_user_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.text     "description"
    t.string   "link_name"
    t.string   "link_for"
    t.datetime "release_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.datetime "deleted_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.text     "description"
    t.integer  "number"
    t.text     "html_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.datetime "deleted_at"
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.string   "name"
    t.string   "surname"
    t.datetime "deleted_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  create_table "vouchers", force: :cascade do |t|
    t.string   "status"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.datetime "deleted_at"
  end

  add_foreign_key "drink_groups", "drink_groups"
  add_foreign_key "drink_groups", "users"
  add_foreign_key "drink_items", "users"
  add_foreign_key "menu_groups", "users"
  add_foreign_key "menu_items", "users"
  add_foreign_key "users", "roles"
end
