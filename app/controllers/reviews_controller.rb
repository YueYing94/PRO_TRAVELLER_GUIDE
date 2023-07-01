class ReviewsController < ApplicationController
  def new
    @geter = User.find(params[:user_id])
    @review = Review.new
    authorize @review
  end

  def create
    @geter = User.find(params[:user_id])
    @review = Review.new(review_params)
    @giver = current_user
    @review.giver = @giver
    @review.geter = @geter
    authorize @review
    @review.save
    redirect_to user_path(@geter)
  end

  private

  def review_params
    params.require(:review).permit(:star, :badge)
  end
end
