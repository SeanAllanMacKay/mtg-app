class FormatsController < ApplicationController
    def index
        @test = (Card.all.length + Type.all.length + Format.all.length + Color.all.length + CardFormat.all.length + CardType.all.length + CardColor.all.length)
    end
end
