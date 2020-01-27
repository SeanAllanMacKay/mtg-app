class Format < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true

    has_many :card_formats
    has_many :cards, through: :card_formats
end
