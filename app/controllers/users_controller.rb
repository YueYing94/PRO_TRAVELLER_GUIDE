class UsersController < ApplicationController
  def profile
    @user = current_user
    @tour = Tour.new
  end

  def show
    @user = User.find(params[:id])
  end
end
