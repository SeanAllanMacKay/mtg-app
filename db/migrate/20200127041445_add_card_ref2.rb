class AddCardRef2 < ActiveRecord::Migration[6.0]
  def change
    add_reference :card_formats, :card, index: true
    add_reference :card_formats, :format, index: true
  end
end
