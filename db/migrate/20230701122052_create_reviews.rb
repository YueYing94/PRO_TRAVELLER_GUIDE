class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :giver, foreign_key: { to_table: :users }
      t.references :geter, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
