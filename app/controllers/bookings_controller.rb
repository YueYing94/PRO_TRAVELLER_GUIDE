class BookingsController < ApplicationController
  def create
    @tour = Tour.find(params[:tour_id])
    # authorize @tour
    # if @tour.user == current_user
    #   flash.alert = "Cannot book your own tour."
    #   redirect_to tour_path(@tour)
    # else
      @booking = Booking.new
      @booking.tour = @tour
      @booking.user = current_user
      @booking.status = "pending..."
      # authorize @booking
      if @booking.save
        redirect_to tour_path(@tour)
      else
        render "tours/index", status: :unprocessable_entity
      end

    # end
  end
end
