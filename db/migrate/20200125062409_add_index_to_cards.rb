class AddIndexToCards < ActiveRecord::Migration[6.0]
  def change
    change_column :cards, :name, :string
    add_index :cards, :name, unique: true
  end
end
