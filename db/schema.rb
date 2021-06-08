# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_08_181558) do

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.integer "number"
    t.integer "floor"
    t.string "apartment"
    t.integer "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_addresses_on_city_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities", force: :cascade do |t|
    t.integer "province_id", null: false
    t.string "name"
    t.integer "zip_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["province_id"], name: "index_cities_on_province_id"
  end

  create_table "complainants", force: :cascade do |t|
    t.integer "person_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_complainants_on_person_id"
  end

  create_table "damages", force: :cascade do |t|
    t.string "type"
    t.integer "person_id", null: false
    t.integer "property_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_damages_on_person_id"
    t.index ["property_id"], name: "index_damages_on_property_id"
  end

  create_table "defendants", force: :cascade do |t|
    t.integer "person_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_defendants_on_person_id"
  end

  create_table "employees", force: :cascade do |t|
    t.integer "person_id", null: false
    t.string "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_employees_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_people_on_address_id"
  end

  create_table "police_stations", force: :cascade do |t|
    t.integer "address_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_police_stations_on_address_id"
  end

  create_table "policemen", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "police_station_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_policemen_on_person_id"
    t.index ["police_station_id"], name: "index_policemen_on_police_station_id"
  end

  create_table "properties", force: :cascade do |t|
    t.integer "address_id", null: false
    t.string "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_properties_on_address_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "date"
    t.string "details"
    t.integer "policeman_id", null: false
    t.integer "complainant_id", null: false
    t.integer "defendant_id", null: false
    t.integer "category_id", null: false
    t.integer "damage_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_reports_on_category_id"
    t.index ["complainant_id"], name: "index_reports_on_complainant_id"
    t.index ["damage_id"], name: "index_reports_on_damage_id"
    t.index ["defendant_id"], name: "index_reports_on_defendant_id"
    t.index ["policeman_id"], name: "index_reports_on_policeman_id"
  end

  create_table "trials", force: :cascade do |t|
    t.string "details"
    t.datetime "date"
    t.integer "report_id", null: false
    t.integer "employee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_trials_on_employee_id"
    t.index ["report_id"], name: "index_trials_on_report_id"
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "cities", "provinces"
  add_foreign_key "complainants", "people"
  add_foreign_key "damages", "people"
  add_foreign_key "damages", "properties"
  add_foreign_key "defendants", "people"
  add_foreign_key "employees", "people"
  add_foreign_key "people", "addresses"
  add_foreign_key "police_stations", "addresses"
  add_foreign_key "policemen", "people"
  add_foreign_key "policemen", "police_stations"
  add_foreign_key "properties", "addresses"
  add_foreign_key "reports", "categories"
  add_foreign_key "reports", "complainants"
  add_foreign_key "reports", "damages"
  add_foreign_key "reports", "defendants"
  add_foreign_key "reports", "policemen"
  add_foreign_key "trials", "employees"
  add_foreign_key "trials", "reports"
end
