class Api::V1::RoomsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show, :joinroom]

  def index
    rooms = Room.all()
    render json: rooms
  end

  def show
    room = Room.find(params[:id])
  end

  def joinroom
    byebug
    room = Room.find(params[:roomId])
    user = User.find(decode_token.first['id'])
    obj =  {room_id: room.id, users: []}
    obj[:users].push(user.id)
    render json: obj
  end

  private

  def decode_token
    begin
       JWT.decode(params[:userId], 'somesecretkey', true, { :algorithm => 'HS256' })
     rescue JWT::DecodeError
      [{}]
     end
  end
end
