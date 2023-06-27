class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  def bookmarked?(tour)
    bookmarks.exists?(tour: tour)
  end
  has_many :bookmarks
  has_many :bookmarked_tours, through: :bookmarks, source: :tour
  has_many :tours
end
