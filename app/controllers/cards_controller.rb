require 'pp'
class CardsController < ApplicationController
    def index
        cards = []
        search_string = params[:search_string]

        if(search_string != nil)
            Card.where("name LIKE '%#{search_string}%' OR text LIKE '%#{search_string}%'").each do |card|
                cards.push({
                    card: card,
                    mana_cost: card['mana_cost'] != nil ? card['mana_cost'].scan(/({.*?})/) : nil
                })
            end
        else
            Card.where(id: 1..30).each do |card|
                cards.push({
                    card: card,
                    mana_cost: card['mana_cost'].scan(/({.*?})/)
                })
            end
        end

        @cards = cards
    end

    def show
        card = Card.find_by(name: params[:name])
        image = card['mana_cost'].scan(/({.*?})/)
        @card = {
            card: card,
            mana_cost: image
        }

        pp card
    end
end
