class AddNameIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :formats, :name, unique: true
  end
end
