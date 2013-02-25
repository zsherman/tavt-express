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

ActiveRecord::Schema.define(:version => 20130225132202) do

  create_table "cars", :force => true do |t|
    t.string   "vin"
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.integer  "value"
    t.string   "vid"
    t.string   "trim"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.integer  "searches"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "plan_id"
    t.integer  "user_id"
    t.boolean  "active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
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
    t.string   "business_name"
    t.string   "doing_business_as"
    t.string   "website_url"
    t.string   "category"
    t.integer  "avg_monthly_sales"
    t.string   "tax_id"
    t.string   "state"
    t.string   "zip_code"
    t.string   "address"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "plan_id"
    t.string   "city"
    t.boolean  "active"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
