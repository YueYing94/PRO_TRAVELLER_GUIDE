class AddBookingToReview < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :booking, foreign_key: true
  end
end
