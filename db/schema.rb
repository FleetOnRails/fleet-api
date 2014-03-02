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

ActiveRecord::Schema.define(version: 20131221163218) do

  create_table "cars", force: true do |t|
    t.string   "make"
    t.string   "model"
    t.string   "registration"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cars", ["owner_id", "owner_type"], name: "cars_ix"

  create_table "destinations", force: true do |t|
    t.string   "name"
    t.integer  "destinationable_id"
    t.string   "destinationable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "destinations", ["destinationable_id", "destinationable_type"], name: "destinations_ix"

  create_table "diagnostic_faults", force: true do |t|
    t.string   "fault_code"
    t.boolean  "status"
    t.integer  "car_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "diagnostic_faults", ["car_id"], name: "diagnostic_fault_ix"

  create_table "diagnostic_statistics", force: true do |t|
    t.float    "mph"
    t.float    "rpm"
    t.float    "mpg"
    t.integer  "car_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "diagnostic_statistics", ["car_id"], name: "diagnostic_statistics_ix"

  create_table "documents", force: true do |t|
    t.string   "name"
    t.string   "media"
    t.integer  "documentable_id"
    t.string   "documentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "documents", ["documentable_id", "documentable_type"], name: "documents_ix"

  create_table "fuel_entries", force: true do |t|
    t.float    "odometer"
    t.float    "liters"
    t.float    "price"
    t.string   "fuel_type"
    t.string   "filling_station"
    t.boolean  "filled_tank"
    t.text     "comment"
    t.integer  "car_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fuel_entries", ["car_id"], name: "fuel_entries_ix"

  create_table "gps_statistics", force: true do |t|
    t.float    "mph"
    t.integer  "car_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gps_statistics", ["car_id"], name: "gps_statistics_ix"

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.string   "city"
    t.string   "county"
    t.string   "country"
    t.integer  "locationable_id"
    t.string   "locationable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["locationable_id", "locationable_type"], name: "locations_ix"

  create_table "oauth_access_grants", force: true do |t|
    t.integer  "resource_owner_id",              null: false
    t.integer  "application_id",                 null: false
    t.string   "token",                          null: false
    t.integer  "expires_in",                     null: false
    t.string   "redirect_uri",      limit: 2048, null: false
    t.datetime "created_at",                     null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true

  create_table "oauth_access_tokens", force: true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true

  create_table "oauth_applications", force: true do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.string   "redirect_uri", limit: 2048, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true

  create_table "products", force: true do |t|
    t.string   "name"
    t.float    "price"
    t.string   "part_no"
    t.integer  "productable_id"
    t.string   "productable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["productable_id", "productable_type"], name: "products_ix"

  create_table "service_records", force: true do |t|
    t.string   "odometer_reading"
    t.string   "technician"
    t.text     "description"
    t.integer  "car_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "service_records", ["car_id"], name: "service_record_ix"

  create_table "user_groups", force: true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_groups", ["group_id", "user_id"], name: "user_groups_ix"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "phone_no"
    t.string   "password"
    t.string   "salt"
    t.boolean  "admin"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.string   "supplies"
    t.integer  "venderable_id"
    t.string   "venderable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vendors", ["venderable_id", "venderable_type"], name: "vendors_ix"

end
