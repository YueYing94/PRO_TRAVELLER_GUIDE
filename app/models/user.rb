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
end
