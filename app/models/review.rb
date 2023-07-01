class Review < ApplicationRecord
  BADGE = ['friendly', 'knowledgeable', 'funny', 'unique tour', 'great for kids', 'would recommend']
  belongs_to :giver, class_name: "User"
  belongs_to :geter, class_name: "User"
  validates :star, presence: true, inclusion: { in: 1..5 }
  validates :badge, presence: true
  validates :badge, inclusion: { in: BADGE }
end
