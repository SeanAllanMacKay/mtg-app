class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :mana_cost
      t.integer :CMC
      t.string :text
      t.integer :power
      t.integer :toughness
      t.integer :loyaly
      t.string :image

      t.timestamps
    end
  end
end
