class BookmarksController < ApplicationController
  def create
    @tour = Tour.find(params[:tour_id])
    @bookmark = Bookmark.new
    @bookmark.tour = @tour
    @bookmark.user = current_user
    authorize @bookmark
    @bookmark.save
    redirect_to tours_path
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmark.destroy
    # redirect_to tours_path, status: :see_other
    redirect_back(fallback_location: root_path)
  end
end
