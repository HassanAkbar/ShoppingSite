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

ActiveRecord::Schema.define(version: 20150729134405) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_category_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "categories", ["parent_category_id"], name: "index_categories_on_parent_category_id"

  create_table "items", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "available_quantity"
    t.float    "price_unit"
    t.text     "description"
    t.string   "state"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "name"
  end

  add_index "items", ["available_quantity"], name: "items_by_available_quantity"
  add_index "items", ["category_id"], name: "index_items_on_category_id"
  add_index "items", ["price_unit"], name: "items_by_price_unit"
  add_index "items", ["state"], name: "items_by_state"

  create_table "order_line_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.decimal  "price",      precision: 20, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "order_line_items", ["item_id"], name: "index_order_line_items_on_item_id"
  add_index "order_line_items", ["order_id"], name: "index_order_line_items_on_order_id"
  add_index "order_line_items", ["price"], name: "order_line_items_by_price"
  add_index "order_line_items", ["quantity"], name: "order_line_items_by_quanitity"

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.datetime "checkout_date"
    t.string   "order_state"
    t.datetime "order_delivered_date"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"
  add_index "orders", ["customer_id"], name: "orders_list_by_id"
  add_index "orders", ["order_state"], name: "orders_list_by_state"

  create_table "reviews", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "rating"
    t.text     "description"
    t.string   "state"
    t.integer  "item_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reviews", ["customer_id"], name: "index_reviews_on_customer_id"
  add_index "reviews", ["item_id"], name: "index_reviews_on_item_id"
  add_index "reviews", ["rating"], name: "reviews_by_rating"
  add_index "reviews", ["state"], name: "reviews_by_state"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "address"
    t.string   "email"
    t.string   "phone"
    t.string   "password"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["email"], name: "users_by_email", unique: true

end
