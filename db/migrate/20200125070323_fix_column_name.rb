class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :cards, :loyaly, :loyalty
  end
end
