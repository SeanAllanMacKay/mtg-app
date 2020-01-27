class AddColumnsToCardFormats < ActiveRecord::Migration[6.0]
  def change
    add_column :card_formats, :name, :string
  end
end
