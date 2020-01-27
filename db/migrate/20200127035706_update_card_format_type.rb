class UpdateCardFormatType < ActiveRecord::Migration[6.0]
  def change
    remove_column :card_formats, :card_id, :string
    remove_column :card_formats, :format_id, :string

    add_column :card_formats, :card, :references
    add_column :card_formats, :format, :references
  end
end
