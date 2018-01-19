class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {username: @user.username, id: @user.id, token: issue_token({id: @user.id})}
    else
      render({json: {error: 'User was not created'}, status: 422})
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
