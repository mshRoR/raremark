# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_14_124628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", comment: "Contries name", force: :cascade do |t|
    t.string "name", null: false, comment: "Name of country"
    t.string "iso2", comment: "shortcode of country name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_countries_on_name"
  end

  create_table "disease_histories", comment: "Store user diseases entry", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "disease_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["disease_id"], name: "index_disease_histories_on_disease_id"
    t.index ["user_id"], name: "index_disease_histories_on_user_id"
  end

  create_table "diseases", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", comment: "User profile details", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "gender", default: "", null: false, comment: "store user gender"
    t.integer "born_year", comment: "store user born year"
    t.integer "born_month", comment: "store user born month"
    t.string "age_range", comment: "store user age range"
    t.bigint "country_id", null: false
    t.integer "profile_type", default: 0, null: false, comment: "store user type (Patient or Carer)"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_profiles_on_country_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", comment: "Users records entry", force: :cascade do |t|
    t.string "email", default: "", null: false, comment: "User email id"
    t.string "name", default: "", null: false, comment: "Name of user"
    t.datetime "deleted_at", comment: "User deleted date and time"
    t.datetime "suspended_at", comment: "User suspended date and time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "disease_histories", "diseases"
  add_foreign_key "disease_histories", "users"
  add_foreign_key "profiles", "countries"
  add_foreign_key "profiles", "users"
end
