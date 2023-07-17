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

ActiveRecord::Schema[7.0].define(version: 2023_07_06_104739) do
  create_table "bookmarks", charset: "utf8mb4", force: :cascade do |t|
    t.string "destination"
    t.date "departure_date"
    t.date "return_date"
    t.integer "members"
    t.string "name"
    t.date "day_1"
    t.datetime "time_1"
    t.string "location_1"
    t.text "description_1"
    t.date "day_2"
    t.datetime "time_2"
    t.string "location_2"
    t.text "description_2"
    t.date "day_3"
    t.datetime "time_3"
    t.string "location_3"
    t.text "description_3"
    t.date "day_4"
    t.datetime "time_4"
    t.string "location_4"
    t.text "description_4"
    t.date "day_5"
    t.datetime "time_5"
    t.string "location_5"
    t.text "description_5"
    t.date "day_6"
    t.datetime "time_6"
    t.string "location_6"
    t.text "description_6"
    t.date "day_7"
    t.datetime "time_7"
    t.string "location_7"
    t.text "description_7"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookmarks", "users"
end
