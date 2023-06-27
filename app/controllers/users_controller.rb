class UsersController < ApplicationController
  def profile
    @user = current_user
    @bookmarked_tours = @user.bookmarked_tours
    @tour = Tour.new
    authorize current_user
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end
end
