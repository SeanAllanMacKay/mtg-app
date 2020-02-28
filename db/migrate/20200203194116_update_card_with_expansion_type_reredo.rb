class UpdateCardWithExpansionTypeReredo < ActiveRecord::Migration[6.0]
  def change
    remove_column :cards, :expansion
  end
end
