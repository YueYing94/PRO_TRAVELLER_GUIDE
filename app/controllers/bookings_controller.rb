class BookingsController < ApplicationController
  def create
    @tour = Tour.find(params[:tour_id])
    @booking = Booking.new
    authorize @booking
    @booking.tour = @tour
    @booking.user = current_user
    @booking.status = "pending..."
    if @booking.save
      redirect_to profile_path
    else
      render "tours/index", status: :unprocessable_entity
    end
  end


  def accept
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(status: "Accepted!")
    @booking.save
    redirect_to profile_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    @booking.save
    redirect_to profile_path
  end

  def pending?
    status == 'pending...'
  end

end
