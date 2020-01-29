# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_28_231949) do

  create_table "card_colors", force: :cascade do |t|
    t.integer "card_id"
    t.integer "color_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "card_formats", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "legality"
    t.integer "card_id"
    t.integer "format_id"
    t.index ["card_id"], name: "index_card_formats_on_card_id"
    t.index ["format_id"], name: "index_card_formats_on_format_id"
  end

  create_table "card_types", force: :cascade do |t|
    t.integer "card_id", null: false
    t.integer "type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_card_types_on_card_id"
    t.index ["type_id"], name: "index_card_types_on_type_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "mana_cost"
    t.integer "CMC"
    t.string "text"
    t.integer "power"
    t.integer "toughness"
    t.integer "loyalty"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_cards_on_name", unique: true
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.string "initial"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["initial"], name: "index_colors_on_initial", unique: true
    t.index ["name"], name: "index_colors_on_name", unique: true
  end

  create_table "formats", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_formats_on_name", unique: true
  end

  create_table "icons", force: :cascade do |t|
    t.string "symbol"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["symbol"], name: "index_icons_on_symbol", unique: true
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.boolean "subtype"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
