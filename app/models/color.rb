class Color < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true

    validates :initial, presence: true
    validates :initial, uniqueness: true

    has_many :card_colors
    has_many :cards, through: :card_colors
end
