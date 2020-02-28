class CreateRarities < ActiveRecord::Migration[6.0]
  def change
    create_table :rarities do |t|
      t.string :name

      t.timestamps
    end

    rename_column :expansions, :expansion, :code
    rename_column :expansions, :expansion_name, :name
  end
end
