class Tour < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, :date, :time, :description, :capacity, :duration, :photos, :start_point, presence: true
  has_many_attached :photos
  geocoded_by :start_point
  after_validation :geocode, if: :will_save_change_to_start_point?

  include PgSearch::Model
  pg_search_scope :search_by_start_point, against: :start_point, using: {
    tsearch: { prefix: true }
  }
  pg_search_scope :search_by_date, against: :date
  {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
