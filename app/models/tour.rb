class Tour < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :date, :time, :description, :capacity, :duration, :start_point, presence: true
  has_many_attached :photos
  geocoded_by :start_point
  after_validation :geocode, if: :will_save_change_to_start_point?
end
