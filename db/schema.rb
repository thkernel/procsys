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

ActiveRecord::Schema.define(version: 20190227232536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "phone"
    t.string "slug"
    t.string "brand_file_name"
    t.string "brand_content_type"
    t.bigint "brand_file_size"
    t.datetime "brand_updated_at"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "company"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "phone"
    t.string "slug"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.bigint "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean "status", default: true
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "motifs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "status", default: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_motifs_on_user_id"
  end

  create_table "order_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "status", default: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_order_types_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "ref"
    t.datetime "order_date"
    t.datetime "arrival_date"
    t.bigint "order_type_id"
    t.bigint "customer_id"
    t.boolean "status", default: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["order_type_id"], name: "index_orders_on_order_type_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "task_statuses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "status", default: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_task_statuses_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "service_id"
    t.integer "contact"
    t.bigint "motif_id"
    t.datetime "time_limit"
    t.datetime "processing_date"
    t.boolean "status", default: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["motif_id"], name: "index_tasks_on_motif_id"
    t.index ["service_id"], name: "index_tasks_on_service_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "unavailabilities", force: :cascade do |t|
    t.integer "actor"
    t.datetime "unavailability_date"
    t.text "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_unavailabilities_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.bigint "service_id"
    t.bigint "created_by"
    t.bigint "role_id"
    t.string "position"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.bigint "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "status", default: "enable", null: false
    t.boolean "receives_notifications", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["service_id"], name: "index_users_on_service_id"
  end

  add_foreign_key "companies", "users"
  add_foreign_key "customers", "users"
  add_foreign_key "motifs", "users"
  add_foreign_key "order_types", "users"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "order_types"
  add_foreign_key "orders", "users"
  add_foreign_key "services", "users"
  add_foreign_key "task_statuses", "users"
  add_foreign_key "tasks", "motifs"
  add_foreign_key "tasks", "services"
  add_foreign_key "tasks", "users"
  add_foreign_key "unavailabilities", "users"
end
