class ToursController < ApplicationController
  def index
    @tours = policy_scope(Tour)
    @markers = @tours.geocoded.map do |tour|
      {
        lat: tour.latitude,
        lng: tour.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { tour: tour })
      }
    end
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user = current_user
    authorize @tour
    @tour.save
    redirect_to profile_path
  end

  def update
    @tour = Tour.find(params[:id])
    authorize @tour
    @tour.update(tour_params)
    redirect_to profile_path
  end

  def destroy
    @tour = Tour.find(params[:id])
    authorize @tour
    @tour.destroy
    redirect_to profile_path, status: :see_other
  end

  private

  def tour_params
    params.require(:tour).permit(:name, :date, :time, :description, :capacity, :duration, :start_point, :user_id, photos: [])
  end
end
