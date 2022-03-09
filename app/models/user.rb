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

  before_save :update_gadgets_geocoding!, if: :will_save_change_to_address?

  private

  def update_gadgets_geocoding!
    return if owned_gadgets.empty?

    first_gadget = owned_gadgets.first
    first_gadget.geocode

    owned_gadgets.update_all(
      latitude: first_gadget.latitude,
      longitude: first_gadget.longitude
    )
  end
end
