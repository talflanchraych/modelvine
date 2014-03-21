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

ActiveRecord::Schema.define(version: 20140315194153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_codes", force: true do |t|
    t.string   "code"
    t.boolean  "used",       default: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "used_by"
  end

  create_table "agencies", force: true do |t|
    t.text   "bio"
    t.string "website"
  end

  create_table "businesses", force: true do |t|
    t.text   "bio"
    t.string "website"
    t.string "type"
  end

  create_table "makeup_artists", force: true do |t|
    t.string   "model_mayhem"
    t.string   "website"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "models", force: true do |t|
    t.date     "birth_date"
    t.string   "gender"
    t.float    "height"
    t.integer  "weight"
    t.string   "ethnicity"
    t.string   "eye_color"
    t.string   "hair_color"
    t.string   "model_mayhem"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cup"
    t.string   "dress_size"
    t.string   "shoe_size"
    t.string   "bust"
    t.string   "waist"
    t.string   "hips"
    t.string   "website"
  end

  create_table "photographers", force: true do |t|
    t.string   "model_mayhem"
    t.string   "website"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_photos", force: true do |t|
    t.string   "caption"
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "photo_width",        default: 300, null: false
    t.integer  "photo_height",       default: 300, null: false
  end

  add_index "user_photos", ["user_id", "created_at"], name: "index_user_photos_on_user_id_and_created_at", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "zip_code"
    t.string   "type_of_user"
    t.string   "user_website"
    t.boolean  "admin",                  default: false
    t.boolean  "approved",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "user_type_id"
    t.string   "user_type_type"
    t.integer  "default_photo_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
