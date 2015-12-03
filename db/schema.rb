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

ActiveRecord::Schema.define(version: 20151203150815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.datetime "datetime"
    t.integer  "activity"
    t.integer  "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "activities", ["day_id"], name: "index_activities_on_day_id", using: :btree

  create_table "appointments", force: :cascade do |t|
    t.datetime "datetime"
    t.text     "description"
    t.text     "summary"
    t.integer  "day_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "appointments", ["day_id"], name: "index_appointments_on_day_id", using: :btree

  create_table "daylights", force: :cascade do |t|
    t.datetime "sunrise"
    t.datetime "sunset"
    t.integer  "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "daylights", ["day_id"], name: "index_daylights_on_day_id", using: :btree

  create_table "days", force: :cascade do |t|
    t.date     "date"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "days", ["person_id"], name: "index_days_on_person_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.datetime "datetime"
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locations", ["day_id"], name: "index_locations_on_day_id", using: :btree

  create_table "luminosities", force: :cascade do |t|
    t.datetime "datetime"
    t.float    "light"
    t.integer  "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "luminosities", ["day_id"], name: "index_luminosities_on_day_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "code"
    t.string   "identity"
    t.string   "name"
    t.string   "gender"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "sleeps", force: :cascade do |t|
    t.date     "date"
    t.integer  "sleep_time"
    t.integer  "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sleeps", ["day_id"], name: "index_sleeps_on_day_id", using: :btree

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "weathers", force: :cascade do |t|
    t.date     "date"
    t.integer  "max_temperature"
    t.integer  "mean_temperature"
    t.integer  "min_temperature"
    t.integer  "precipitation"
    t.string   "events"
    t.integer  "day_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "weathers", ["day_id"], name: "index_weathers_on_day_id", using: :btree

  create_table "works", force: :cascade do |t|
    t.string   "name"
    t.datetime "start"
    t.datetime "finish"
    t.integer  "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "works", ["day_id"], name: "index_works_on_day_id", using: :btree

  add_foreign_key "activities", "people", column: "day_id"
  add_foreign_key "appointments", "people", column: "day_id"
  add_foreign_key "daylights", "people", column: "day_id"
  add_foreign_key "days", "people"
  add_foreign_key "locations", "people", column: "day_id"
  add_foreign_key "luminosities", "people", column: "day_id"
  add_foreign_key "sleeps", "people", column: "day_id"
  add_foreign_key "weathers", "people", column: "day_id"
  add_foreign_key "works", "people", column: "day_id"
end
