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

ActiveRecord::Schema.define(version: 20141004200654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "houses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pin"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "purchase_date"
    t.integer  "user_id"
    t.integer  "house_id"
    t.boolean  "bought"
    t.boolean  "perishable"
  end

  create_table "users", force: true do |t|
    t.string   "handle"
    t.text     "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "house_id"
  end

  add_index "users", ["house_id"], name: "index_users_on_house_id", using: :btree

end
