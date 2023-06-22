class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.references :tour, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
