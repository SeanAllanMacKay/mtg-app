class CreateCardExpansions < ActiveRecord::Migration[6.0]
  def change
    create_table :card_expansions do |t|
      t.references :card, null: false, foreign_key: true
      t.references :expansion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
