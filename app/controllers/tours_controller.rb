class ToursController < ApplicationController
  def index
    @tours = Tour.all
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

  private

  def tour_params
    params.require(:tour).permit(:name, :date, :time, :description, :capacity, :duration, :start_point, :user_id, photos: [])
  end
end
