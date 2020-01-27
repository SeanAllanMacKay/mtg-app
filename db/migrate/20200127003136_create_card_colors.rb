class CreateCardColors < ActiveRecord::Migration[6.0]
  def change
    create_table :card_colors do |t|
      t.integer :card_id
      t.integer :color_id

      t.timestamps
    end
  end
end
