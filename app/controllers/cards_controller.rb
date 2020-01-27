class CardsController < ApplicationController
    def new
    end

    def create
    end

    def index
        render({json: Card.all.length})
    end
end
