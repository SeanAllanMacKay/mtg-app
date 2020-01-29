class CardsController < ApplicationController
    def index
        cards = []

        Card.where(id: 1..30).each do |card|
            cards.push({
                card: card,
                mana_cost: card['mana_cost'].scan(/({.*?})/)
            })
        end

        @cards = cards
    end
end
