class CreateCardRarities < ActiveRecord::Migration[6.0]
  def change
    create_table :card_rarities do |t|
      t.references :card, null: false, foreign_key: true
      t.references :rarity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
