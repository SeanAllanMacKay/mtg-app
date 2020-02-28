class Type < ApplicationRecord
    validates :type_name, presence: true
    validates :type_name, uniqueness: true

    has_many :card_types
    has_many :cards, through: :card_types
end
