class RemoveForeignKeys < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key "card_types", "cards"
    remove_foreign_key "card_types", "types"
  end
end
