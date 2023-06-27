class BookmarksController < ApplicationController
  def create
    @tour = Tour.find(params[:tour_id])
    current_user.bookmarked_tours << @tour
    redirect_to profile_path(current_user)
  end
  resources :tours do
    post 'bookmark', to: 'bookmarks#create', as: :bookmark
  end
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to profile_path, notice: 'Tour unbookmarked successfully.'
  end
end
