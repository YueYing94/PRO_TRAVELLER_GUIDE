class ToursController < ApplicationController
  def index
    @tours = Tour.all
    if params[:query].present?
      @tours = Tour.search_by_start_point_and_date(params[:query])
      @search_query = params[:query]
      @result_count = @tours.count
    else

    end
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user = current_user
    @tour.save
    redirect_to profile_path
  end

  def update
    @tour = Tour.find(params[:id])
    @tour.update(tour_params)
    redirect_to profile_path
  end

  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy
    redirect_to profile_path, status: :see_other
  end

  # def search
  #   @tours = Tour.where(start_point: tour_params[:query])
  #   @search_query = params[:query]
  #   @result_count = @tours.count
  # end

  private

  def tour_params
    params.require(:tour).permit(:name, :date, :time, :description, :capacity, :duration, :start_point, :user_id, photos: [])
  end
end
