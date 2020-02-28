class Card < ActiveRecord::Base
    validates :cad_name, presence: true
    validates :card_name, uniqueness: true

    has_many :card_formats
    has_many :formats, through: :card_formats
    accepts_nested_attributes_for :card_formats

    has_many :card_colors
    has_many :colors, through: :card_colors

    has_many :card_Types
    has_many :types, through: :card_Types

    has_many :card_expansions
    has_many :expansion, through: :card_expansions

    has_many :card_rarities
    has_many :rarity, through: :card_rarities
end
