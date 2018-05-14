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

ActiveRecord::Schema.define(version: 20180426201026) do

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "hold",       default: false
  end

  add_index "carts", ["user_id"], name: "index_carts_on_user_id"

  create_table "fb_users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "food_orders", force: :cascade do |t|
    t.integer  "food_id"
    t.integer  "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "food_orders", ["cart_id"], name: "index_food_orders_on_cart_id"
  add_index "food_orders", ["food_id"], name: "index_food_orders_on_food_id"

  create_table "foods", force: :cascade do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "img"
  end

  create_table "pizza_orders", force: :cascade do |t|
    t.integer  "pizza_id"
    t.integer  "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pizza_orders", ["cart_id"], name: "index_pizza_orders_on_cart_id"
  add_index "pizza_orders", ["pizza_id"], name: "index_pizza_orders_on_pizza_id"

  create_table "pizzas", force: :cascade do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "price"
    t.string   "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "img"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.boolean  "admin",           default: false
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
