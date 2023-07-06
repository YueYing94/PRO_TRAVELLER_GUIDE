class BookmarksController < ApplicationController
  def create
    @tour = Tour.find(params[:tour_id])
    @bookmark = Bookmark.new
    @bookmark.tour = @tour
    @bookmark.user = current_user
    authorize @bookmark
    @bookmark.save
    redirect_to profile_path(current_user)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to profile_path, notice: 'Tour unbookmarked successfully.'
  end

end
