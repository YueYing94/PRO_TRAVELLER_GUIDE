class UsersController < ApplicationController
  def profile
    @user = current_user
    @tour = Tour.new
  end
end
