class AddRestrictionsToColors < ActiveRecord::Migration[6.0]
  def change
    add_index :colors, :name, unique: true
    add_index :colors, :initial, unique: true
  end
end
