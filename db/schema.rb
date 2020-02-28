ActiveRecord::Schema.define(version: 2020_02_27_052901) do

  create_table "card_colors", force: :cascade do |t|
    t.integer "card_id"
    t.integer "color_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "card_expansions", force: :cascade do |t|
    t.integer "card_id", null: false
    t.integer "expansion_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_card_expansions_on_card_id"
    t.index ["expansion_id"], name: "index_card_expansions_on_expansion_id"
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

  create_table "card_rarities", force: :cascade do |t|
    t.integer "card_id", null: false
    t.integer "rarity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_card_rarities_on_card_id"
    t.index ["rarity_id"], name: "index_card_rarities_on_rarity_id"
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
    t.string "card_name"
    t.string "mana_cost"
    t.integer "CMC"
    t.string "text"
    t.integer "power"
    t.integer "toughness"
    t.integer "loyalty"
    t.string "card_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "multiverse_id"
    t.string "rulings"
    t.index ["card_name"], name: "index_cards_on_card_name", unique: true
  end

  create_table "colors", force: :cascade do |t|
    t.string "color_name"
    t.string "initial"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["color_name"], name: "index_colors_on_color_name", unique: true
    t.index ["initial"], name: "index_colors_on_initial", unique: true
  end

  create_table "expansions", force: :cascade do |t|
    t.string "code"
    t.string "expansion_name"
    t.string "released_at"
    t.string "expansion_type"
    t.integer "card_count"
    t.string "parent_expansion"
    t.string "icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "formats", force: :cascade do |t|
    t.string "format_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["format_name"], name: "index_formats_on_format_name", unique: true
  end

  create_table "icons", force: :cascade do |t|
    t.string "symbol"
    t.string "icon_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["symbol"], name: "index_icons_on_symbol", unique: true
  end

  create_table "rarities", force: :cascade do |t|
    t.string "rarity_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "type_name"
    t.boolean "subtype"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "card_expansions", "cards"
  add_foreign_key "card_expansions", "expansions"
  add_foreign_key "card_rarities", "cards"
  add_foreign_key "card_rarities", "rarities"
end
