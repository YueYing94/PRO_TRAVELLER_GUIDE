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

ActiveRecord::Schema[7.0].define(version: 2023_07_06_180356) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tour_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_bookings_on_tour_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tour_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_bookmarks_on_tour_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.bigint "asker_id"
    t.bigint "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["asker_id"], name: "index_chatrooms_on_asker_id"
    t.index ["receiver_id"], name: "index_chatrooms_on_receiver_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "giver_id"
    t.bigint "geter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "star"
    t.string "badge"
    t.bigint "booking_id"
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["geter_id"], name: "index_reviews_on_geter_id"
    t.index ["giver_id"], name: "index_reviews_on_giver_id"
  end

  create_table "tours", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.time "time"
    t.text "description"
    t.integer "capacity"
    t.string "duration"
    t.string "start_point"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_tours_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "description"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "tours"
  add_foreign_key "bookings", "users"
  add_foreign_key "bookmarks", "tours"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "chatrooms", "users", column: "asker_id"
  add_foreign_key "chatrooms", "users", column: "receiver_id"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "reviews", "users", column: "geter_id"
  add_foreign_key "reviews", "users", column: "giver_id"
  add_foreign_key "tours", "users"
end
