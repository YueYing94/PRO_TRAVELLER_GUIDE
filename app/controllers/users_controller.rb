class UsersController < ApplicationController
  def profile
    @user = current_user
    @tour = Tour.new
    authorize current_user
    @booking = Booking.new
  end

  def show
    @user = User.find(params[:id])
    @chatroom = Chatroom.new
    authorize @user
    @booking = Booking.new
    @bookings = Booking.all
  end
end
