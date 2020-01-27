class RemoveColumnsToCardFormats < ActiveRecord::Migration[6.0]
  def change
    remove_column :card_formats, :name, :string
  end
end
