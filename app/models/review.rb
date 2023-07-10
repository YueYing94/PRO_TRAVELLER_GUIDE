class Review < ApplicationRecord

  BADGE = ['friendly', 'knowledgeable', 'funny', 'adventurous', 'great for kids', 'would recommend']
  belongs_to :giver, class_name: "User"
  belongs_to :geter, class_name: "User"
  validates :star, presence: true, inclusion: { in: 1..5 }
  serialize :badge, Array
  validates :badge, presence: true
  validates :badge, inclusion: { in: BADGE }
  belongs_to :booking
end
