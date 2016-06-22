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

ActiveRecord::Schema.define(version: 20160618112854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pays_fuels", force: :cascade do |t|
    t.string   "number"
    t.string   "unit"
    t.string   "name"
    t.string   "address"
    t.decimal  "balance",    default: 10.0
    t.boolean  "deleted",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "pays_records", force: :cascade do |t|
    t.string   "order"
    t.string   "item"
    t.string   "number"
    t.string   "name"
    t.string   "money"
    t.string   "balance"
    t.boolean  "deleted",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "pays_users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.string   "phone"
    t.string   "remember_digest"
    t.string   "authentication_token"
    t.boolean  "deleted",              default: false
    t.boolean  "admin",                default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "pays_waters", force: :cascade do |t|
    t.string   "number"
    t.string   "unit"
    t.string   "name"
    t.string   "address"
    t.decimal  "balance",    default: 10.0
    t.boolean  "deleted",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "shortens_shortens", force: :cascade do |t|
    t.string   "short"
    t.string   "url"
    t.integer  "count",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
