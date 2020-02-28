class CreateExpansions < ActiveRecord::Migration[6.0]
  def change
    create_table :expansions do |t|
      t.string :expansion
      t.string :expansion_name
      t.string :released_at
      t.string :expansion_type
      t.integer :card_count
      t.string :parent_expansion
      t.string :icon

      t.timestamps
    end
  end
end
