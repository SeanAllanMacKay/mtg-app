class Rarity < ApplicationRecord
    validates :rarity_name, presence: true
    validates :rarity_name, uniqueness: true

    has_many :card_rarities
    has_many :cards, through: :card_rarities
end
