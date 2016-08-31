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

ActiveRecord::Schema.define(version: 20160830083022) do

  create_table "daily_weights", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "sprint_id"
    t.date     "date"
    t.decimal  "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "project_name"
    t.date     "target_date"
    t.decimal  "target_weight"
    t.boolean  "is_active"
    t.date     "start_date"
    t.decimal  "start_weight"
    t.decimal  "end_weight"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "sprints", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.date     "target_date"
    t.decimal  "target_weight"
    t.boolean  "is_active"
    t.date     "start_date"
    t.decimal  "start_weight"
    t.decimal  "end_weight"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.float    "weight"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
