class AddSetNameToCard < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :set_name, :string
  end
end
