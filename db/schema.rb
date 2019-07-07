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

ActiveRecord::Schema.define(version: 20190707004318) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.string   "user_name",     limit: 255
    t.string   "name_kana",     limit: 255
    t.string   "tel",           limit: 255
    t.string   "postalcode",    limit: 255
    t.integer  "prefecture_id", limit: 4
    t.string   "city",          limit: 255
    t.string   "street",        limit: 255
    t.string   "others",        limit: 255
    t.boolean  "defaultflg",                default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "approvalitems", force: :cascade do |t|
    t.integer  "approval_id", limit: 4
    t.integer  "item_id",     limit: 4
    t.string   "reason",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "approvalitems", ["approval_id"], name: "index_approvalitems_on_approval_id", using: :btree
  add_index "approvalitems", ["item_id"], name: "index_approvalitems_on_item_id", using: :btree

  create_table "approvals", force: :cascade do |t|
    t.string   "status",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cartitems", force: :cascade do |t|
    t.integer  "quantity",   limit: 4
    t.integer  "item_id",    limit: 4
    t.integer  "order_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "quantity",   limit: 4
    t.integer  "item_id",    limit: 4
    t.integer  "order_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credits", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "customer_id", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dvendors", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "for_api_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.integer  "approval_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "infos", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: :cascade do |t|
    t.integer  "itemCodeNo",  limit: 4
    t.string   "partNumber",  limit: 255
    t.string   "itemName",    limit: 255
    t.integer  "genre_id",    limit: 4
    t.integer  "subgenre_id", limit: 4
    t.float    "price",       limit: 24
    t.string   "description", limit: 255
    t.string   "attention",   limit: 255
    t.string   "mainImage",   limit: 255
    t.string   "image2",      limit: 255
    t.string   "image3",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "likes_count", limit: 4,   default: 0, null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "item_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["item_id"], name: "index_likes_on_item_id", using: :btree
  add_index "likes", ["user_id", "item_id"], name: "index_likes_on_user_id_and_item_id", unique: true, using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "managers", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
  end

  add_index "managers", ["confirmation_token"], name: "index_managers_on_confirmation_token", unique: true, using: :btree
  add_index "managers", ["email"], name: "index_managers_on_email", unique: true, using: :btree
  add_index "managers", ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true, using: :btree

  create_table "managers_positions", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "description", limit: 255
    t.string   "address",     limit: 255
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
    t.integer  "manager_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orderdats", force: :cascade do |t|
    t.date     "dat",                    null: false
    t.integer  "sum_sales",    limit: 4, null: false
    t.integer  "sum_register", limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "order_no",    limit: 255
    t.integer  "user_id",     limit: 4
    t.string   "total_price", limit: 255
    t.integer  "address_id",  limit: 4
    t.integer  "dvendor_id",  limit: 4
    t.string   "d_number",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "description", limit: 255
    t.string   "address",     limit: 255
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "item_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "score",      limit: 4
    t.string   "comment",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "subgenres", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.integer  "genre_id",    limit: 4,   null: false
    t.integer  "approval_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.datetime "soft_destroyed_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["soft_destroyed_at"], name: "index_users_on_soft_destroyed_at", using: :btree

  add_foreign_key "likes", "items"
  add_foreign_key "likes", "users"
end
