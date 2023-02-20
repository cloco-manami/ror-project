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

ActiveRecord::Schema[7.0].define(version: 2023_02_17_031501) do
  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.text "content"
    t.integer "order", default: 0
    t.integer "status"
    t.text "memo"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", default: "t", null: false
    t.string "last_name", default: "t", null: false
    t.string "first_name_kana", default: "t", null: false
    t.string "last_name_kana", default: "t", null: false
    t.integer "age"
    t.integer "gender"
    t.string "password", default: "t", null: false
    t.string "token"
    t.string "phone_number"
    t.date "birth_date"
    t.float "height"
    t.float "weight"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
