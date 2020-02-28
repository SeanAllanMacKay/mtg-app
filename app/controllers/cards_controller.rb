require 'pp'
class CardsController < ApplicationController
    def index
        cards = []
        @search_string = params[:search_string]
        @page = params[:page] ? params[:page] : 1

        @expansions = Expansion.where(expansion_type: 'expansion')
        @types = Type.where(subtype: false)
        @subtypes = Type.where(subtype: true)

        if(@search_string != nil)
            Card.
                joins(:types, :expansion).
                where("card_name LIKE '%#{@search_string}%' OR text LIKE '%#{@search_string}%'").
                where("code != 'cmb1'").
                where("type_name != 'Token' AND type_name != 'Card' AND type_name != 'Vanguard'").
                distinct.
                page(@page).
                each do |thing|
                    cards.push({
                        card: thing,
                        mana_cost: thing['mana_cost'] ? thing['mana_cost'].scan(/({.*?})/) : []
                    })
                end
        else
            Card.page(@page).each do |card|
                cards.push({
                    card: card,
                    mana_cost: card['mana_cost'].scan(/({.*?})/)
                })
            end
        end

        @cards = cards
    end

    def show
        card = Card.joins(:card_formats).find_by(card_name: params[:card_name])
        image = card['mana_cost'].scan(/({.*?})/)
        @card = {
            card: card,
            mana_cost: image,
        }
    end
end
