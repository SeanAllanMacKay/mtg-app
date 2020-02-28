class AddPrefixingToColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :cards, :name, :card_name
    rename_column :expansions, :name, :expansion_name
    rename_column :colors, :name, :color_name
    rename_column :formats, :name, :format_name
    rename_column :rarities, :name, :rarity_name
    rename_column :types, :name, :type_name

    rename_column :cards, :image, :card_image
    rename_column :icons, :image, :icon_image
  end
end
