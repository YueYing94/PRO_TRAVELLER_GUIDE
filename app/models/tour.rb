class Tour < ApplicationRecord
  belongs_to :user
  validates :name, :date, :time, :description, :capacity, :duration, :start_point, presence: true
end
