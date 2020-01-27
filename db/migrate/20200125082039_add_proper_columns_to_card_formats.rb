class AddProperColumnsToCardFormats < ActiveRecord::Migration[6.0]
  def change
    add_column :card_formats, :card_id, :integer
    add_column :card_formats, :format_id, :integer
  end
end
