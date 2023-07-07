class ReviewsController < ApplicationController
  def new
    @geter = User.find(params[:user_id])
    @booking = Booking.find(params[:name])
    @review = Review.new
    authorize @review
  end

  def create

    @geter = User.find(params[:user_id])
    @booking = Booking.find(params[:booking][:id])
    @review = Review.new(review_params)
    @giver = current_user
    @review.giver = @giver
    @review.geter = @geter
    @review.booking = @booking
    authorize @review
    badge = params[:review][:badge].reject!(&:empty?)
    @review.badge = badge
    if @review.save
      redirect_to user_path(@geter)
    else
      render "reviews/new", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:star, :badge, :booking_id)
  end
end
