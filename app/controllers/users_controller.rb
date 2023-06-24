class UsersController < ApplicationController
  def profile
    @user = current_user
    @tour = Tour.new
    @booking = Booking.new
  end

  def show
    @user = User.find(params[:id])
    @booking = Booking.new
  end
end
