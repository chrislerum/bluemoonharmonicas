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

ActiveRecord::Schema.define(:version => 20140204182650) do

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
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "carts", :force => true do |t|
    t.datetime "purchased_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
  end

  create_table "colors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comb_images", :force => true do |t|
    t.string   "photo"
    t.integer  "comb_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "display_order", :default => 0
  end

  create_table "combs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "brand_id"
    t.integer  "model_id"
    t.integer  "material_type_id"
    t.integer  "color_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "price_cents",      :default => 0, :null => false
    t.integer  "quantity",         :default => 0, :null => false
  end

  create_table "custom_htmls", :force => true do |t|
    t.text     "content"
    t.integer  "display_order"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "faqs", :force => true do |t|
    t.text    "question"
    t.text    "answer"
    t.integer "position"
  end

  add_index "faqs", ["position"], :name => "index_faqs_on_position"

  create_table "harmonica_images", :force => true do |t|
    t.string   "photo"
    t.integer  "harmonica_id"
    t.integer  "display_order", :default => 0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "harmonicas", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "brand_id"
    t.integer  "model_id"
    t.integer  "key_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "price_cents", :default => 0, :null => false
    t.integer  "quantity",    :default => 0, :null => false
  end

  create_table "keys", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "line_items", :force => true do |t|
    t.float   "unit_price"
    t.integer "cart_id"
    t.integer "quantity"
    t.string  "description"
    t.text    "special_instructions"
    t.integer "purchasable_id"
    t.string  "purchasable_type"
  end

  add_index "line_items", ["cart_id"], :name => "index_line_items_on_cart_id"

  create_table "links", :force => true do |t|
    t.string  "title"
    t.string  "link"
    t.text    "description"
    t.integer "position"
  end

  add_index "links", ["position"], :name => "index_links_on_position"

  create_table "material_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "models", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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

  create_table "powder_coated_cover_images", :force => true do |t|
    t.string   "photo"
    t.integer  "powder_coated_cover_id"
    t.integer  "display_order",          :default => 0
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "powder_coated_covers", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "brand_id"
    t.integer  "model_id"
    t.integer  "color_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "price_cents", :default => 0, :null => false
    t.integer  "quantity",    :default => 0, :null => false
  end

  create_table "snippets", :force => true do |t|
    t.string "shortcut"
    t.text   "text"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "admin"
  end

  create_table "videos", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "display"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "snippet"
  end

end
