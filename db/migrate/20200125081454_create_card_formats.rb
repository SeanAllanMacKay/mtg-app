class CreateCardFormats < ActiveRecord::Migration[6.0]
  def change
    create_table :card_formats do |t|

      t.timestamps
    end
  end
end
