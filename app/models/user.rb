class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :gadgets # gadgets.user_id
  # has_many :gadgets, foreign_key: :owner_id # gadgets.user_id
  has_many :owned_gadgets, foreign_key: :owner_id, class_name: "Gadget"
  has_many :owner_bookings, through: :owned_gadgets, source: :bookings

  has_many :customer_bookings, foreign_key: :customer_id, class_name: "Booking"
  has_many :booked_gadgets, class_name: "Gadget", through: :customer_bookings, source: :gadget
end
