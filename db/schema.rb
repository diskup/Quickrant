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

ActiveRecord::Schema.define(version: 2021_12_08_085058) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "fix_requests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "shop_id", null: false
    t.integer "fix_status", default: 0, null: false
    t.text "user_message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "admin_mssage"
  end

  create_table "image_favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "image_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "food_image_id", null: false
    t.string "shop_image_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationsips", force: :cascade do |t|
    t.integer "following_id", null: false
    t.integer "followed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.integer "user_id", null: false
    t.float "value", null: false
    t.text "comment", null: false
    t.integer "about_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "shop_id", null: false
    t.integer "schedule_status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop__favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "prefectures", null: false
    t.string "city", null: false
    t.string "address", null: false
    t.string "name", null: false
    t.string "building_name", null: false
    t.float "longitude", null: false
    t.float "latitude", null: false
    t.text "description", null: false
    t.integer "minimum_price", null: false
    t.integer "max_price", null: false
    t.integer "phone_number", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.text "time_description", null: false
    t.integer "is_active", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_maps", force: :cascade do |t|
    t.integer "shop_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timeline_favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "timeline_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timelines", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "shop_id", null: false
    t.string "post_image_id", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nickname", null: false
    t.string "current_prefectures", null: false
    t.string "background_image_id", null: false
    t.string "icon_image_id", null: false
    t.text "introduction", null: false
    t.boolean "is_quited", default: false, null: false
    t.boolean "private_account", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
