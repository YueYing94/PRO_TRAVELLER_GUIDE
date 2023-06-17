class CreateTours < ActiveRecord::Migration[7.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.date :date
      t.time :time
      t.text :description
      t.integer :capacity
      t.string :duration
      t.string :start_point
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
