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

ActiveRecord::Schema.define(version: 20_211_222_143_032) do

  create_table "favorites", force: :cascade do |t|
    t.integer "shop_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_favorites_on_shop_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "image_favorites", force: :cascade do |t|
    t.integer "image_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_image_favorites_on_image_id"
    t.index ["user_id"], name: "index_image_favorites_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.integer "shop_id"
    t.integer "user_id"
    t.string "food_image_id"
    t.string "shop_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_images_on_shop_id"
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "following_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["following_id"], name: "index_relationships_on_following_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "shop_id"
    t.integer "user_id"
    t.float "score", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_reviews_on_shop_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "shops", force: :cascade do |t|
    t.integer "user_id"
    t.string "prefectures", null: false
    t.string "address", null: false
    t.string "name", null: false
    t.string "building_name"
    t.float "longitude"
    t.float "latitude"
    t.text "description", null: false
    t.integer "minimum_price", null: false
    t.integer "max_price", null: false
    t.string "phone_number"
    t.time "start_time"
    t.time "end_time"
    t.text "time_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shops_on_user_id"
  end

  create_table "tag_maps", force: :cascade do |t|
    t.integer "shop_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_tag_maps_on_shop_id"
    t.index ["tag_id"], name: "index_tag_maps_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timeline_favorites", force: :cascade do |t|
    t.integer "timeline_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["timeline_id"], name: "index_timeline_favorites_on_timeline_id"
    t.index ["user_id"], name: "index_timeline_favorites_on_user_id"
  end

  create_table "timelines", force: :cascade do |t|
    t.integer "shop_id"
    t.integer "user_id"
    t.string "post_image_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_timelines_on_shop_id"
    t.index ["user_id"], name: "index_timelines_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nickname", null: false
    t.string "current_prefectures", null: false
    t.string "background_image_id"
    t.string "icon_image_id"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
