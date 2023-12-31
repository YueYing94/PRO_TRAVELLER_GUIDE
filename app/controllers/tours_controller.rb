class ToursController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @tours = policy_scope(Tour)
    @markers = @tours.geocoded.map do |tour|
      {
        lat: tour.latitude,
        lng: tour.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { tour: tour })
      }
    end
    if params[:location_query].present?
      @tours = @tours.where("start_point ILIKE ?", "%#{params[:location_query]}%")
    end
    if params[:start_date].present? && params[:end_date].present?
      @tours = Tour.where(date: params[:start_date]..params[:end_date])
    end
    if params[:location_query].present? && params[:start_date].present? && params[:end_date].present?
      @tours = Tour.where(date: params[:start_date]..params[:end_date]).search_by_start_point(params[:location_query])
    end
    @booking = Booking.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user = current_user
    authorize @tour
    respond_to do |format|
      if @tour.save
        @user = current_user
        format.html { redirect_to profile_path }
        format.json
      else
        @user = current_user
        format.html { render "users/profile", status: :unprocessable_entity }
        format.json
      end
    end
  end

  def update
    @tour = Tour.find(params[:id])
    authorize @tour
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to profile_path }
        format.json
      else
        @user = current_user
        format.html { render "users/profile", status: :unprocessable_entity }
        format.json
      end
    end
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
