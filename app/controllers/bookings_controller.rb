class BookingsController < ApplicationController
  def create
    @tour = Tour.find(params[:tour_id])
    @booking = Booking.new
    authorize @booking
    @booking.tour = @tour
    @booking.user = current_user
    @booking.status = "pending..."
    if @booking.save
      redirect_to tour_path(@tour)
    else
      render "tours/index", status: :unprocessable_entity
    end
  end
end
