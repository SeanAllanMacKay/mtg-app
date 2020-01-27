class AddLegalityColumnToCardFormats < ActiveRecord::Migration[6.0]
  def change
    add_column :card_formats, :legality, :boolean
  end
end
