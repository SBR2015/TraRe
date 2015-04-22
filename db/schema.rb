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

ActiveRecord::Schema.define(version: 20150416113215) do

  create_table "languages", force: :cascade do |t|
    t.string   "code",       limit: 2, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "languages", ["code"], name: "index_languages_on_code", unique: true

  create_table "resumes", force: :cascade do |t|
    t.text     "sentence"
    t.boolean  "is_translation"
    t.integer  "owner_id"
    t.integer  "translator_id"
    t.integer  "language_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "resumes", ["language_id"], name: "index_resumes_on_language_id"
  add_index "resumes", ["owner_id"], name: "index_resumes_on_owner_id"
  add_index "resumes", ["translator_id"], name: "index_resumes_on_translator_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username",               default: "", null: false
    t.string   "realname",               default: "", null: false
    t.integer  "native_language_id"
    t.integer  "best_language_id"
  end

  add_index "users", ["best_language_id"], name: "index_users_on_best_language_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["native_language_id"], name: "index_users_on_native_language_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
