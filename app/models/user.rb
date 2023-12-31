class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tours
  has_one_attached :image
  has_many :bookings
  has_many :messages
  has_many :chatrooms_as_asker, class_name: "Chatroom", foreign_key: :asker_id
  has_many :chatrooms_as_receiver, class_name: "Chatroom", foreign_key: :receiver_id
  has_many :reviews_as_giver, class_name: "Review", foreign_key: :giver_id
  has_many :reviews_as_geter, class_name: "Review", foreign_key: :geter_id
  has_many :bookmarks
  has_many :bookmarked_tours, through: :bookmarks, source: :tour
  validates :image, presence: true
  def bookmarked?(tour)
    bookmarks.exists?(tour: tour)
  end
end
