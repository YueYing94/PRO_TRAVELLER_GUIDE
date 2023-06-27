class UsersController < ApplicationController
  def profile
    @user = current_user
    @bookmarked_tours = @user.bookmarked_tours
    @tour = Tour.new
  end
end
