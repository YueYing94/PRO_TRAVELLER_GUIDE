class AddCommentAndStarToRating < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :comment, :text
    add_column :reviews, :star, :integer
  end
end
