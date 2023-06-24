class Tour < ApplicationRecord
  belongs_to :user
  validates :name, :date, :time, :description, :capacity, :duration, :start_point, presence: true
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_by_start_point, against: [ :start_point ], using:
  {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
