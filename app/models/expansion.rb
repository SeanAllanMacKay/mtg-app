class Expansion < ApplicationRecord
    validates :code, presence: true
    validates :code, uniqueness: true
    validates :expansion_name, presence: true
    validates :expansion_name, uniqueness: true

    has_many :card_expansions
    has_many :cards, through: :card_expansions
end
