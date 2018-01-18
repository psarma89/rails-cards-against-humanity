class CardsController < ApplicationController

  CARDS = {
  "blackCards": [],
  "whiteCards": [],
  "Base": {},
  "order": [
    "Base"
  ]
  }

  def index
    render json: CARDS
  end
end
