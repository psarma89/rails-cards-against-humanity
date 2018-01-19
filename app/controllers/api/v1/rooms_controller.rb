class Api::V1::RoomsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

  def index
    rooms = Room.all()
    render json: rooms
  end

  def show
    room = Room.find(params[:id])
  end
end
