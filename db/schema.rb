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

ActiveRecord::Schema.define(version: 20140813055016) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_properties", id: false, force: true do |t|
    t.integer "category_id", null: false
    t.integer "property_id", null: false
  end

  add_index "categories_properties", ["property_id", "category_id"], name: "index_categories_properties_on_property_id_and_category_id", using: :btree

  create_table "categories_stock_properties", id: false, force: true do |t|
    t.integer "category_id",       null: false
    t.integer "stock_property_id", null: false
  end

  add_index "categories_stock_properties", ["category_id"], name: "index_categories_stock_properties_on_category_id", using: :btree
  add_index "categories_stock_properties", ["stock_property_id"], name: "index_categories_stock_properties_on_stock_property_id", using: :btree

  create_table "items", force: true do |t|
    t.integer  "product_id"
    t.integer  "shop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["product_id"], name: "index_items_on_product_id", using: :btree
  add_index "items", ["shop_id"], name: "index_items_on_shop_id", using: :btree

  create_table "product_properties", force: true do |t|
    t.integer  "product_id"
    t.integer  "property_id"
    t.integer  "property_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_properties", ["product_id"], name: "index_product_properties_on_product_id", using: :btree
  add_index "product_properties", ["property_id"], name: "index_product_properties_on_property_id", using: :btree
  add_index "product_properties", ["property_item_id"], name: "index_product_properties_on_property_item_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "properties", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "property_items", force: true do |t|
    t.integer  "property_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "property_items", ["property_id"], name: "index_property_items_on_property_id", using: :btree

  create_table "shops", force: true do |t|
    t.integer  "owner_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sku_properties", force: true do |t|
    t.integer  "sku_id"
    t.integer  "stock_property_id"
    t.integer  "stock_propery_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sku_properties", ["sku_id"], name: "index_sku_properties_on_sku_id", using: :btree
  add_index "sku_properties", ["stock_property_id"], name: "index_sku_properties_on_stock_property_id", using: :btree
  add_index "sku_properties", ["stock_propery_item_id"], name: "index_sku_properties_on_stock_propery_item_id", using: :btree

  create_table "skus", force: true do |t|
    t.integer  "item_id"
    t.string   "name"
    t.integer  "inventory"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skus", ["item_id"], name: "index_skus_on_item_id", using: :btree

  create_table "stock_properties", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_property_items", force: true do |t|
    t.integer  "stock_property_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stock_property_items", ["stock_property_id"], name: "index_stock_property_items_on_stock_property_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
