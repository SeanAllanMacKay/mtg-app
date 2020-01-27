class Type < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true

    has_many :card_types
    has_many :cards, through: :card_types
end
