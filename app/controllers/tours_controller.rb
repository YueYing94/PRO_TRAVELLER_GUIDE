class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user = current_user

    if @tour.save
      current_user.bookmarked_tours << @tour
      redirect_to profile_path(current_user)
    else
      redirect_to profile_path, flash: { error: "Tour creation failed." }
    end
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

  def bookmark
    @tour = Tour.find(params[:id])
    current_user.bookmarked_tours << @tour
    redirect_to profile_path(current_user)
  end

  private

  def tour_params
    params.require(:tour).permit(:name, :date, :time, :description, :capacity, :duration, :start_point, :user_id, photos: [])
  end
end
