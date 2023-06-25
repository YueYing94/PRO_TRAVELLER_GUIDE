class Tour < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :date, :time, :description, :capacity, :duration, :photos, :start_point, presence: true
  has_many_attached :photos
end
