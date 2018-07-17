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

ActiveRecord::Schema.define(version: 2018_07_16_160208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "status"
    t.string "origin"
    t.integer "budget_pp"
    t.string "excluded_countries"
    t.bigint "package_id"
    t.bigint "user_id"
    t.string "climate"
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_traveller"
    t.string "accommodation_type"
    t.datetime "start_time"
    t.integer "price_cents", default: 0, null: false
    t.jsonb "payment"
    t.index ["package_id"], name: "index_bookings_on_package_id"
    t.index ["type_id"], name: "index_bookings_on_type_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "name"
    t.text "comment"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "origins", force: :cascade do |t|
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "package_origins", force: :cascade do |t|
    t.bigint "package_id"
    t.bigint "origin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["origin_id"], name: "index_package_origins_on_origin_id"
    t.index ["package_id"], name: "index_package_origins_on_package_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "city"
    t.string "country"
    t.string "climate"
    t.integer "price"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "flight_departure_time"
    t.string "accommodation_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "lat"
    t.string "long"
    t.bigint "type_id"
    t.index ["type_id"], name: "index_packages_on_type_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travellers", force: :cascade do |t|
    t.string "passport_number"
    t.date "passport_expiration"
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "nationality"
    t.date "birth_date"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_travellers_on_booking_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "credit_card_owner"
    t.string "credit_card_nr"
    t.string "csv"
    t.date "expiry_date"
    t.bigint "traveller_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["traveller_id"], name: "index_users_on_traveller_id"
  end

  add_foreign_key "bookings", "packages"
  add_foreign_key "bookings", "types"
  add_foreign_key "bookings", "users"
  add_foreign_key "comments", "posts"
  add_foreign_key "package_origins", "origins"
  add_foreign_key "package_origins", "packages"
  add_foreign_key "packages", "types"
  add_foreign_key "travellers", "bookings"
  add_foreign_key "users", "travellers"
end
