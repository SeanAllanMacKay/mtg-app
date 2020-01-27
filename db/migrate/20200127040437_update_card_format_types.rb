class UpdateCardFormatTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :card_formats, :card, :references
    add_column :card_formats, :format_id, :references
  end
end
