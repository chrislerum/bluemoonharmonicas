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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130927022410) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "carts", :force => true do |t|
    t.datetime "purchased_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
  end

  create_table "categories", :force => true do |t|
    t.string  "name"
    t.integer "parent_id"
    t.integer "position"
  end

  add_index "categories", ["position"], :name => "index_categories_on_position"

  create_table "categories_items", :force => true do |t|
    t.integer "category_id"
    t.integer "item_id"
  end

  create_table "faqs", :force => true do |t|
    t.text    "question"
    t.text    "answer"
    t.integer "position"
  end

  add_index "faqs", ["position"], :name => "index_faqs_on_position"

  create_table "harp_models", :force => true do |t|
    t.string   "name"
    t.string   "brand"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.string  "name"
    t.string  "shortname"
    t.text    "description"
    t.float   "price"
    t.integer "quantity"
    t.boolean "manages_inventory"
    t.boolean "upgradable"
    t.integer "harp_model_id"
    t.float   "upgrade_price"
  end

  add_index "items", ["harp_model_id"], :name => "index_items_on_harp_model_id"

  create_table "items_options", :id => false, :force => true do |t|
    t.integer "item_id"
    t.integer "option_id"
  end

  add_index "items_options", ["item_id", "option_id"], :name => "index_items_options_on_item_id_and_option_id"

  create_table "line_items", :force => true do |t|
    t.float   "unit_price"
    t.integer "cart_id"
    t.integer "quantity"
    t.integer "variant_id"
    t.integer "purchasable_id"
    t.string  "purchasable_type"
    t.string  "description"
    t.text    "special_instructions"
  end

  add_index "line_items", ["cart_id"], :name => "index_line_items_on_cart_id"
  add_index "line_items", ["purchasable_id"], :name => "index_line_items_on_purchasable_id"
  add_index "line_items", ["purchasable_type"], :name => "index_line_items_on_purchasable_type"
  add_index "line_items", ["variant_id"], :name => "index_line_items_on_variant_id"

  create_table "links", :force => true do |t|
    t.string  "title"
    t.string  "link"
    t.text    "description"
    t.integer "position"
  end

  add_index "links", ["position"], :name => "index_links_on_position"

  create_table "option_values", :force => true do |t|
    t.string  "title"
    t.float   "price_diff"
    t.integer "option_id"
  end

  add_index "option_values", ["option_id"], :name => "index_option_values_on_option_id"

  create_table "options", :force => true do |t|
    t.string "title"
    t.string "sentence"
  end

  create_table "order_transactions", :force => true do |t|
    t.integer  "order_id"
    t.string   "action"
    t.float    "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "order_transactions", ["order_id"], :name => "index_order_transactions_on_order_id"

  create_table "orders", :force => true do |t|
    t.integer  "cart_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "ip_address"
    t.string   "express_token"
    t.string   "express_payer_id"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "email"
    t.string   "address"
  end

  add_index "orders", ["cart_id"], :name => "index_orders_on_cart_id"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "photos", :force => true do |t|
    t.string  "caption"
    t.string  "src"
    t.string  "href"
    t.integer "position"
    t.integer "photographable_id"
    t.string  "photographable_type"
  end

  add_index "photos", ["photographable_id"], :name => "index_photos_on_photographable_id"
  add_index "photos", ["photographable_type"], :name => "index_photos_on_photographable_type"

  create_table "snippets", :force => true do |t|
    t.string "shortcut"
    t.text   "text"
  end

  create_table "upgrades", :force => true do |t|
    t.integer  "variant_id"
    t.integer  "line_item_id"
    t.string   "upgrade_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "upgrades", ["line_item_id"], :name => "index_upgrades_on_line_item_id"
  add_index "upgrades", ["variant_id"], :name => "index_upgrades_on_variant_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "admin"
  end

  create_table "variants", :force => true do |t|
    t.integer "option_value_id"
    t.integer "item_id"
    t.integer "quantity"
  end

  add_index "variants", ["option_value_id"], :name => "index_variants_on_option_value_id"

end
