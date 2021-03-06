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

ActiveRecord::Schema.define(version: 20180422131353) do

  create_table "employees", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",          null: false
    t.string   "encrypted_password",     limit: 255, default: "",          null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,           null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.date     "birth_date"
    t.string   "gender",                 limit: 255
    t.string   "blood_group",            limit: 255
    t.string   "contact_no",             limit: 255
    t.date     "joining_date"
    t.string   "department",             limit: 255
    t.string   "qualification",          limit: 255
    t.string   "role",                   limit: 255, default: "developer"
  end

  add_index "employees", ["email"], name: "index_employees_on_email", unique: true, using: :btree
  add_index "employees", ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true, using: :btree

  create_table "employees_projects", id: false, force: :cascade do |t|
    t.integer "project_id",  limit: 4
    t.integer "employee_id", limit: 4
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.date     "start_date"
    t.date     "end_date"
    t.string   "location",    limit: 255
    t.string   "client_name", limit: 255
    t.string   "status",      limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "manager_id",  limit: 4
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "status",      limit: 255
    t.integer  "employee_id", limit: 4
    t.integer  "project_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
