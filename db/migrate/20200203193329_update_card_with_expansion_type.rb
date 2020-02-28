class UpdateCardWithExpansionType < ActiveRecord::Migration[6.0]
  def change
    remove_column :cards, :set_name

    add_column :cards, :expansion, :reference
  end
end
