class AddSetAndMultiverseIdToCard < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :rarity, :string
    add_column :cards, :set, :string
    add_column :cards, :multiverse_id, :integer
  end
end
