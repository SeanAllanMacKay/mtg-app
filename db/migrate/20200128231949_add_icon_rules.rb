class AddIconRules < ActiveRecord::Migration[6.0]
  def change
    add_index :icons, :symbol, unique: true
  end
end
