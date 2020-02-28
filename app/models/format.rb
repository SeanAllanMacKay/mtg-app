class Format < ApplicationRecord
    validates :format_name, presence: true
    validates :format_name, uniqueness: true

    has_many :card_formats
    has_many :cards, through: :card_formats
end
