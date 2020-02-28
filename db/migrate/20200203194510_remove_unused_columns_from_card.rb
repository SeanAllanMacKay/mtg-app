class RemoveUnusedColumnsFromCard < ActiveRecord::Migration[6.0]
  def change
    remove_column :cards, :expansion
    remove_column :cards, :set
    remove_column :cards, :rarity
  end
end
