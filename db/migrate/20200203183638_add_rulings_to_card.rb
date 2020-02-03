class AddRulingsToCard < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :rulings, :string
  end
end
