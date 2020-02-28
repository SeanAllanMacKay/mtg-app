class CardRarity < ApplicationRecord
  belongs_to :card
  belongs_to :rarity
end
