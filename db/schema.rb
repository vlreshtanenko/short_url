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

ActiveRecord::Schema[7.0].define(version: 2023_04_28_135829) do
  create_table "clicks", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "platform"
    t.string "country"
    t.string "operating_system"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "url_id"
    t.index ["url_id"], name: "index_clicks_on_url_id"
  end

  create_table "urls", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "original_url"
    t.string "short_url"
    t.string "slug"
    t.integer "clicks_count", default: 0, null: false
    t.integer "unique_clicks_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["original_url"], name: "index_urls_on_original_url", unique: true
    t.index ["short_url"], name: "index_urls_on_short_url", unique: true
    t.index ["slug"], name: "index_urls_on_slug", unique: true
  end

  add_foreign_key "clicks", "urls"
end
