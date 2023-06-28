class UsersController < ApplicationController
  def profile
    @user = current_user
    @tour = Tour.new
    authorize current_user
  end

  def show
    @user = User.find(params[:id])
    @chatroom = Chatroom.new
    authorize @user
  end
end
