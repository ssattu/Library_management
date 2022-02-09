# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_08_114606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.string "price"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.boolean "deleted", default: false
    t.string "author"
  end

  create_table "issue_books", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "user_id", null: false
    t.string "period_of_days"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "returned", default: false
    t.index ["book_id"], name: "index_issue_books_on_book_id"
    t.index ["user_id"], name: "index_issue_books_on_user_id"
  end

  create_table "issued_books", force: :cascade do |t|
    t.bigint "issue_book_id", null: false
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.string "fine"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_issued_books_on_book_id"
    t.index ["issue_book_id"], name: "index_issued_books_on_issue_book_id"
    t.index ["user_id"], name: "index_issued_books_on_user_id"
  end

  create_table "return_books", force: :cascade do |t|
    t.bigint "issue_book_id", null: false
    t.string "return_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["issue_book_id"], name: "index_return_books_on_issue_book_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.boolean "is_admin", default: false
    t.string "avtar"
    t.string "contact"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "issue_books", "books"
  add_foreign_key "issue_books", "users"
  add_foreign_key "issued_books", "books"
  add_foreign_key "issued_books", "issue_books"
  add_foreign_key "issued_books", "users"
  add_foreign_key "return_books", "issue_books"
end
