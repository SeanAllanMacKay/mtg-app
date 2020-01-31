class LandingController < ApplicationController
  def index
    @card = Card.find(rand(1..Card.all.length))
  end
end
